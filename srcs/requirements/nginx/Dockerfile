FROM debian:buster

#apt-get update &&

RUN  apt-get -y install nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/aperis.key -out /etc/ssl/aperis.pem

RUN openssl req -x509 -newkey rsa:2048 -nodes -keyout /etc/ssl/aperis.42.fr.key -out /etc/ssl/aperis.42.fr.pem -days 365 \
    -subj "/C=FR/ST=France/L=Paris/O=42, Inc./OU=IT/CN=aperis.42.fr"

COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT nginx -g 'daemon off;'