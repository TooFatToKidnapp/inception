#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp



#### Todo:
# need to creat volumes for wp and mariadb
# link them together via docker-compose file
# mariadb must start first
# finish wp config
# link env variables with wp !!!

# check if the dir "/var/www/http/wp" dose not existes alredy
if [ ! -d "/var/www/http/wp"];
then

	mkdir -p /var/www/http/wp

	wp --allow-root core download --path=/var/www/http/wp

	mv wp-config-sample.php wp-config.php

	# add input from .env file
	wp create config --dbname=USER_DATA --dbuser=ali --dbpass=Password123 --dbhost=localhost --path=/var/www/http/wp --allow-root



fi

