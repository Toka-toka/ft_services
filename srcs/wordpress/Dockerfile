FROM alpine:3.12

COPY ./export/ .

RUN apk update && apk update && apk add supervisor

RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session && \
    mkdir -p /var/run/php

RUN apk add nginx && \
    mkdir -p /run/nginx && \
    mv ./nginx.conf /etc/nginx/conf.d/default.conf

RUN apk add wget && wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \ 
    mv wordpress /var/www/wordpress && \
    mv ./wp-config.php /var/www/wordpress/wp-config.php

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
    mkdir -p /etc/telegraf  && \
    mv ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 5050

CMD ["/usr/bin/supervisord", "-c", "./supervisord.conf"]