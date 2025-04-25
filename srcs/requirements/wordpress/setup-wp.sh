#!/bin/bash

if [ ! -f "wp-config.php" ]; then
    echo "WordPress not found. Installing..."
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    cp -r wordpress/* .
    rm -rf wordpress latest.tar.gz
    

    chown -R nobody:nobody /var/www/html
    chmod -R 755 /var/www/html
fi

exec "$@"