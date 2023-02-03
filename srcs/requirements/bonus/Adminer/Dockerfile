# admine config
# content managment in a database

FROM debian:buster

RUN apt-get update --assume-yes && apt-get upgrade --assume-yes

RUN apt-get install adminer --assume-yes

WORKDIR /usr/share/adminer/

RUN mv adminer.php index.php

CMD ["php" ,"-S",  "0.0.0.0:8080"]
