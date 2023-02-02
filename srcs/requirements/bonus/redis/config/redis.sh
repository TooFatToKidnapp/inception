#!/bin/sh

sed -i '69s/.*/maxmemory 128M/' /etc/redis/redis.conf
sed -i '566s/.*/bind 0.0.0.0/' /etc/redis/redis.conf
sed -i '597s/.*/maxmemory-policy allkeys-lfu/' /etc/redis/redis.conf

# accept connections from any client
exec redis-server --protected-mode no
