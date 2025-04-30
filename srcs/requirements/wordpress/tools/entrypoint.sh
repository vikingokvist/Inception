#!/bin/sh

mkdir -p /var/www/wordpress

addgroup -S www-data && adduser -S www-data -G www-data
chown -R www-data:www-data /var/www/wordpress
chmod -R 755 /var/www/wordpress
find /var/www/wordpress -type d -exec chmod 775 {} \;
find /var/www/wordpress -type f -exec chmod 664 {} \;


echo "Waiting for MariaDB to be ready..." 2>/dev/stderr
while ! nc -z mariadb 3306; do
	sleep 1
done

echo "Checking for wp-config.php..."
if [ ! -f /var/www/wordpress/wp-config.php ]; then
	echo "Downloading WordPress core..."
	wp core download --allow-root --path='/var/www/wordpress'

	echo "Creating wp-config.php..."
	wp config create --path='/var/www/wordpress' \
		--dbname=$WP_DATABASE \
		--dbuser=$WP_ADMIN_USER \
		--dbpass=$WP_ADMIN_PASSWORD \
		--dbhost='mariadb' --allow-root

	echo "Installing WordPress..."
	wp core install --path='/var/www/wordpress' \
		--url=$WP_URL \
		--title="$WP_TITLE" \
		--admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL --skip-email

	echo "Creating WordPress User..."
	cd /var/www/wordpress
	wp user create $WP_USER $WP_EMAIL --role='editor' --user_pass=$WP_PASSWORD --allow-root

	echo "Configuring Redis..."
	wp config set WP_REDIS_HOST "$WP_REDIS_HOST" --allow-root
	wp config set WP_REDIS_PORT "$WP_REDIS_PORT" --allow-root
	wp config set WP_REDIS_SCHEME "$WP_REDIS_SCHEME" --allow-root
	wp plugin install redis-cache --activate --allow-root

	echo "Waiting for Redis to be ready...." 2>/dev/stderr
	while ! nc -z redis 6379; do
		sleep 1
	done

	echo "Redis Configuration Succesfull!!!"
	wp redis enable --allow-root


else
	echo "WordPress already configured. Skipping installation."
fi


sed -i "s/127.0.0.1/0.0.0.0/" /etc/php83/php-fpm.d/www.conf

echo "Successfully initialized WordPress!"

exec "$@"
