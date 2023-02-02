# redis container config

FROM debian:buster

RUN apt-get update --assume-yes && apt-get upgrade --assume-yes

RUN apt-get install redis-server --assume-yes

COPY config/redis.sh .

RUN chmod +x redis.sh

CMD ["bash", "redis.sh"]

