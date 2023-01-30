#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

sed -i '36s/.*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf
#### Todo:
# finish wp config

# check if the dir "/var/www/http/wp" dose not existes alredy
# if [ ! -d "/var/www/http/wp" ];
# then

	# sleep 5;
	mkdir -p /run/php
	# mkdir -p /var/www/http/wp
	# chown -R nginx:nginx /var/www/http/wp

	cd /var/www/http/wp
	rm -rf *
	wp --allow-root core download --path=/var/www/http/wp
	sleep 5;
	#mv wp-config-sample.php wp-config.php

	# add input from .env file
	wp config create  --dbname=USER_DATA --dbuser=aabdou --dbpass=password123 --dbhost=mariadb --path=/var/www/http/wp --allow-root
	#wp create config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${WORDPRESS_HOST_NAME} --path=/var/www/http/wp --allow-root

# service php7.3-fpm start

	wp core install --path=/var/www/http/wp --url=localhost --title=inception --admin_user=ADMIN --admin_password=Password123 --admin_email=admin@mail.com --skip-email --allow-root

	wp user create ali abdouali422@gmail.com --user_pass=Password123 --path=/var/www/http/wp --allow-root

# service php7.3-fpm stop
# fi

# sleep 100000000
# php-fpm7.3 -F
/usr/sbin/php-fpm7.3 -F
