# ftp config

FROM debian:buster

RUN apt-get update --assume-yes && apt-get upgrade --assume-yes
RUN apt-get install --assume-yes vsftpd

COPY ./config/script.sh .

RUN chmod +x script.sh

CMD ["bash" , "script.sh"]
