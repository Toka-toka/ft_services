FROM alpine:3.12

COPY ./export/ .

RUN apk update && apk update && \
    apk add nginx openssl supervisor && \
    apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 \
-nodes -out /etc/ssl/localhost.crt -keyout /etc/ssl/localhost.key \
-subj "/C=RU/ST=21school/L=21school/O=sedric/CN=www.server_sedric.com"

RUN mkdir -p /run/nginx && \
    mkdir -p /etc/telegraf && \
    mv ./supervisord.conf /etc/supervisord.conf && \
    mv ./nginx_config /etc/nginx/conf.d/default.conf && \
    mv ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 80 443

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]