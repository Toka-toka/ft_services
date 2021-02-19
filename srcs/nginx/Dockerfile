FROM alpine:3.12

RUN apk update && apk update 

RUN apk add nginx openssl openssh supervisor

COPY  ./nginx_config /etc/nginx/conf.d/default.conf

#RUN mkdir /etc/ssl/

# create SSL
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 \
-nodes -out /etc/ssl/localhost.crt -keyout /etc/ssl/localhost.key \
-subj "/C=RU/ST=21school/L=21school/O=sedric/CN=www.server_sedric.com"

COPY  ./start.sh /

EXPOSE 80 443

RUN chmod +x *.sh

RUN mkdir -p /run/nginx

CMD ["./start.sh"]