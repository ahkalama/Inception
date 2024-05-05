FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/ /tmp/

EXPOSE 3306

RUN chmod +x /tmp/init_db.sh

ENTRYPOINT [ "/tmp/init_db.sh" ]

CMD [ "mysqld" ]