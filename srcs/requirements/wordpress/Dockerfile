FROM debian:buster

RUN apt-get --assume-yes update && apt-get --assume-yes upgrade ;
RUN apt-get --assume-yes install curl php-fpm

COPY ./config/wp-setup.sh .
RUN chmod +x wp-setup.sh

CMD ["bash", "wp-setup.sh"]
