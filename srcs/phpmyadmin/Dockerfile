FROM alpine:3.12

COPY ./export/ .

RUN apk update && apk update && apk add supervisor

RUN apk add openssl && \
    openssl req -newkey rsa:2048 -x509 -sha256 -days 365 \
    -nodes -out /etc/ssl/localhost.crt -keyout /etc/ssl/localhost.key \
    -subj "/C=RU/ST=21school/L=21school/O=sedric/CN=www.server_sedric.com"

RUN apk add nginx && \
    mkdir -p /run/nginx && \
    mv ./nginx.conf /etc/nginx/conf.d/default.conf

RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session && \
    mkdir -p /var/run/php

RUN apk add wget && wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-english.tar.xz && \
	mkdir -p /var/www/phpmyadmin && \
    tar -xf phpMyAdmin-4.9.2-english.tar.xz --strip-components 1 -C /var/www/phpmyadmin && \
    mv ./config.inc.php /var/www/phpmyadmin

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
    mkdir -p /etc/telegraf  && \
    mv ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 5000

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]