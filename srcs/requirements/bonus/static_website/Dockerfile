FROM debian:buster

RUN apt-get update --assume-yes && apt-get upgrade --assume-yes

RUN apt-get install --assume-yes python3

COPY tools tools

WORKDIR tools

CMD ["python3", "-m", "http.server", "1234"]
