FROM alpine:3.12

RUN apk update && apk update 

RUN apk add vsftpd openssl vim

# create SSL
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 \
-nodes -out /etc/ssl/my.crt -keyout /etc/ssl/my.key \
-subj "/C=RU/ST=21school/L=21school/O=sedric/CN=www.server_sedric.com"

COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21

CMD ["sh"]