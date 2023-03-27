FROM debian:buster

RUN apt-get update
RUN apt-get install mariadb-server -y

COPY ./conf/maria.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariastart.sh /mariastart.sh
RUN chmod 755 /mariastart.sh
CMD /mariastart.sh