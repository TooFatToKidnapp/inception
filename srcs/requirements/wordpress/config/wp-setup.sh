#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

sed -i '36s/.*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf

mkdir -p /run/php

cd /var/www/http/wp

wp --allow-root core download --path=/var/www/http/wp

sleep 5;

wp config create  --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --path=/var/www/http/wp --allow-root

sleep 3;

wp core install --path=/var/www/http/wp --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMINE_USER} --admin_password=${WP_ADMINE_PASSWORD} --admin_email=${WP_ADMINE_EMAIL} --skip-email --allow-root

sleep 3;

wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD} --path=/var/www/http/wp --allow-root

/usr/sbin/php-fpm7.3 -F
