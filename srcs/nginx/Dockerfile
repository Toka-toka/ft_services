FROM alpine:3.12

COPY ./export/ .

RUN apk update && apk update && apk add supervisor

RUN apk add openssl && \
    openssl req -newkey rsa:2048 -x509 -sha256 -days 365 \
    -nodes -out /etc/ssl/localhost.crt -keyout /etc/ssl/localhost.key \
    -subj "/C=RU/ST=21school/L=21school/O=sedric/CN=www.server_sedric.com"

RUN apk add nginx && \
    mkdir -p /run/nginx && \
    mv ./nginx_config /etc/nginx/conf.d/default.conf

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
    mkdir -p /etc/telegraf  && \
    mv ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 80 443

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]