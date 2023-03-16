FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d
COPY ./tools/create_db.sh /

RUN bash ./create_db.sh


CMD ["mysqld_safe"]
