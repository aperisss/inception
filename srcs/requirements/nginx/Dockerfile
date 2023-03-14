FROM debian:buster

RUN apt-get update && apt-get -y install nginx \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/.conf /etc/nginx/conf.d/

EXPOSE 443

#CMD ["nginx", "-g" "daemon off;"]
ENTRYPOINT nginx -g 'daemon off;'