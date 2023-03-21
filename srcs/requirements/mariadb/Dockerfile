FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /var/run/mysql \
 && chown -R mysql:mysql /var/run/mysql \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
&& chmod 777 /var/run/mysql

EXPOSE 3306

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d
COPY ./tools/create_db.sh /
ENTRYPOINT ["create_db.sh"]


CMD ["mysqld", "--bind-address=0.0.0.0"]