FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add openrc
RUN apk add mariadb mariadb-common mariadb-client
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN mkdir -p /etc/telegraf

COPY ./my.cnf /etc/mysql/
COPY ./telegraf.conf /etc/telegraf/
COPY ./wordpress.sql .
COPY ./start_database.sh .

VOLUME [ "var/lib/mysql" ]
VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 3306

RUN chmod +x /start_database.sh

CMD  [ "sh", "/start_database.sh" ]