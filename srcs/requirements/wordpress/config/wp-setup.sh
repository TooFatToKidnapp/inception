#!/bin/sh

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/wp

cd /var/www/wp

wp --allow-root core download

mv wp-config-sample.php wp-config.php

