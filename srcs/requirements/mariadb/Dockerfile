# mariadb config

FROM debian:buster

RUN apt-get --assume-yes update  && apt-get --assume-yes upgrade ; \
apt-get --assume-yes install mariadb-server mariadb-client ; \
rm -fr /var/lib/apt/lists/* ; \
mkdir -p /var/run/mysqld ; \
chown -R mysql:mysql /var/run/mysqld ; \
chmod 777 /var/run/mysqld

CMD ["mysqld", "--bind-address=0.0.0.0"]
