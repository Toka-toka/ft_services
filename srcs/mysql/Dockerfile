FROM alpine:3.12

COPY ./export/ .

RUN apk update && apk update && apk add supervisor

RUN apk add openrc mariadb mariadb-common mariadb-client && \
    mv ./my.cnf /etc/mysql/ && \
    chmod +x /init_database.sh

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
    mkdir -p /etc/telegraf  && \
    mv ./telegraf.conf /etc/telegraf/telegraf.conf

VOLUME [ "var/lib/mysql" ]
VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 3306

CMD  [ "sh", "./init_database.sh"]