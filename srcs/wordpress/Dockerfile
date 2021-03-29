FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add wget nginx supervisor openrc
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
# RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN mv wordpress /var/www/wordpress

RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php

COPY ./wp-config.php /var/www/wordpress/wp-config.php
COPY ./nginx.conf /etc/nginx/conf.d/nginx.conf
COPY ./supervisord.conf /etc/supervisord.conf

# RUN mkdir -p /etc/telegraf
# COPY ./telegraf.conf /etc/telegraf/

# COPY ./start_server.sh ./tmp
# RUN chmod +x ./tmp/start_server.sh

EXPOSE 5050

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]