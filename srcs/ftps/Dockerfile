FROM alpine:3.12

RUN apk update && apk update 

RUN apk add openssl vsftpd
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 \
-nodes -out /etc/ssl/my.crt -keyout /etc/ssl/my.key \
-subj "/C=RU/ST=21school/L=21school/O=sedric/CN=www.server_sedric.com"

RUN mkdir -p /var/ftp

RUN mkdir -p /var/ftp/user

RUN adduser -D -h /var/ftp user

RUN echo 'user:user' | chpasswd

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]