#!/bin/sh

mkdir -p /var/www/wordpress && chmod -R 755 /var/www/wordpress

# Wait for MariaDB to start
echo "Waiting for MariaDB to be ready..." 2>/dev/stderr
while ! nc -z mariadb 3306; do
    sleep 1
done


# Check if the WordPress files exist
echo "Checking for wp-config.php..."
if [ ! -f /var/www/wordpress/wp-config.php ]; then
  echo "Downloading WordPress core..."
  wp core download --allow-root --path='/var/www/wordpress'

  # Debug: List the directory contents after download attempt
  echo "Listing WordPress directory contents after download attempt:"
#   ls -la /var/www/wordpress

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


  # Creating user (if necessary)
  cd /var/www/wordpress
  wp user create $WP_USER $WP_EMAIL --role='editor' --user_pass=$WP_PASSWORD --allow-root

else
  echo "WordPress already configured. Skipping installation."
fi

# Debug: List the contents after installation
# echo "Listing WordPress directory contents after installation:"
# ls -la /var/www/wordpress

# Fix PHP-FPM config (check if this file exists first)

sed -i "s/127.0.0.1/0.0.0.0/" /etc/php83/php-fpm.d/www.conf


# Pass control to the CMD
exec "$@"
