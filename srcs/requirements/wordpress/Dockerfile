FROM debian:buster

RUN apt-get --assume-yes update && apt-get --assume-yes upgrade

# php-fpm (fastcgi prosses manager) used to run php scripts
# php-mysql php extension that allows php to communicare with mysql databse
RUN export TERM=xterm && apt-get --assume-yes install curl php7.3-fpm less php-mysql

COPY ./config/wp-setup.sh .
RUN chmod +x wp-setup.sh

CMD ["bash", "wp-setup.sh"]
