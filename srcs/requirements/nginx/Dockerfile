FROM debian:buster

RUN apt-get update && apt-get -y install nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/aperis.key -out /etc/ssl/aperis.pem

COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

EXPOSE 443

#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT nginx -g 'daemon off;'