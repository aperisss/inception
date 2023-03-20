FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /var/run/mysqld \
 && chown -R mysql:mysql /var/run/mysqld \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d
COPY ./tools/create_db.sh /

RUN  sh create_db.sh

CMD ["mysql"]
