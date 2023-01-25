#!/bin/sh

# replace specific lines in the mariadb config file
sed -i '19s/.*/port                    = 3306/' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i '28s/.*/bind-address            = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql --user=root --execute "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql --user=root --execute "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql --user=root --execute "USE '${MYSQL_DATABASE}'; GRANT ALL PRIVILEGES ON * TO '${MYSQL_USER}'@'%';"
mysql --user=root --execute "FLUSH PRIVILEGES;"

# service mysqld stop
kill -9 $(cat /var/run/mysqld/mysqld.pid)

# command is used to replace the current process with a new command
# mysqld_safe is the recommended way to start mysqld server, the command \
# adds some safty features such as restarting the server when an error occurs \
# and logging runtime information to an error log

mysqld_safe
