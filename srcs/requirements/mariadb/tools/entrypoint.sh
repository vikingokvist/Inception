#!/bin/sh

mkdir -p /var/lib/mysql /run/mysqld 

if [ ! -d /var/lib/mysql ] || [ ! -d /run/mysqld ]; then
	echo "Directories were not correctly created" 2>/dev/stderr
	exit 1
fi

chown -R mysql:mysql /var/lib/mysql /run/mysqld
chmod -R 755 /run/mysqld

cd /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
	echo "Initializing database..." 2>/dev/stderr
	mariadb-install-db --user=mysql --skip-test-db --datadir=/var/lib/mysql

	echo "Starting temporary MariaDB instance for initialization..." 2>/dev/stderr
	mariadbd-safe --skip-networking --socket=/var/run/mysqld/mysqld.sock --datadir=/var/lib/mysql &
	TEMP_PID=$!

	echo "Waiting for temporary MariaDB instance to be ready..." 2>/dev/stderr
	while ! mariadb-admin ping --socket=/var/run/mysqld/mysqld.sock --silent; do
	    sleep 1
	done

	echo "Executing initial SQL commands..." 2>/dev/stderr
	mariadb -u root --socket=/var/run/mysqld/mysqld.sock << EOF
		CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
		CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
		GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
		FLUSH PRIVILEGES;
EOF

    echo "Shutting down temporary MariaDB instance..." 2>/dev/stderr
    mariadb-admin --socket=/var/run/mysqld/mysqld.sock shutdown
    wait $TEMP_PID
fi

cd /usr/
mariadbd-safe --user=mysql --bind-address="0.0.0.0" --verbose --datadir=/var/lib/mysql
echo "wordpress table was successfully created, database setup COMPLETE" 2>/dev/stderr