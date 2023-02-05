# container advisor config

FROM debian:buster

RUN apt-get update --assume-yes && apt-get upgrade --assume-yes

RUN apt-get --assume-yes install wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.39.2/cadvisor

RUN chmod +x cadvisor

CMD ["./cadvisor"]

