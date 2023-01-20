#!/bin/sh

# replace specific lines in the mariadb config file
sed -i '19s/.*/port                    = 3306/' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i '28s/.*/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql --user=root --execute "CREATE USER 'ali'@'%' IDENTIFIED BY 'password123';"
mysql --user=root --execute "CREATE DATABASE IF NOT EXISTS data;"
mysql --user=root --execute "USE data;"
mysql --user=root --execute "GRANT ALL PRIVILEGES ON * TO 'ali'@'%' WITH GRANT OPTION;"
mysql --user=root --execute "FLUSH PRIVILEGES;"
mysql --user=root --execute "alter user 'root'@'localhost' identified by 'password123'"
