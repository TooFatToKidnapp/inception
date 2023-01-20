# mariadb config

FROM debian:buster

RUN apt-get --assume-yes update && apt-get --assume-yes upgrade ; \
apt-get --assume-yes install mariadb-server

COPY ./config/db-setup.sh .

RUN chmod +x db-setup.sh
RUN bash db-setup.sh


# command is used to replace the current process with a new command
# mysqld_safe is the recommended way to start mysqld server, the command \
# adds some safty features such as restarting the server when an error occurs \
# and logging runtime information to an error log
CMD exec mysqld_safe
