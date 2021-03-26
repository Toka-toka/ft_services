FROM alpine:3.12

RUN apk update && apk update
RUN apk add nginx openssl supervisor
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

# create SSL
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 \
-nodes -out /etc/ssl/localhost.crt -keyout /etc/ssl/localhost.key \
-subj "/C=RU/ST=21school/L=21school/O=sedric/CN=www.server_sedric.com"

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./nginx_config /etc/nginx/conf.d/default.conf
COPY ./telegraf.conf /etc/telegraf/

RUN mkdir -p /run/nginx \
mkdir -p /etc/telegraf

EXPOSE 80 443

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]