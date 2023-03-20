FROM debian:buster
# 

RUN apt-get update -yq
# update the debian image -q is for quiet mode quiet mode is used to avoid the output of the update

RUN apt-get upgrade -y
# update the debian image and upgrade the packages 

RUN apt-get install -y mariadb-server \
&& chown -R mysql:mysql /var/lib/mysqld \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
&& chmod 777 /var/lib/mysqld

# install mariadb-server

EXPOSE 3306
# expose the port 3306 to the host machine 

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d
COPY ./ /var/www/
# copy the conf file to the mariadb.conf.d folder and copy the whole folder to the var/www folder

RUN service mysql start 
#start the mysql server 

COPY ./tools/create_db.sh /create_db.sh
# copy the create_db.sh file to the root directory 

VOLUME  "/var/lib/mysql"
# create a volume to the mysql folder 

ENTRYPOINT  [ "sh", "create_db.sh"]
# start the entrypoint.sh file in the foreground so that the container does not stop