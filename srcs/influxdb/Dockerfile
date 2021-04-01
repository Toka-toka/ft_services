FROM alpine:3.12

COPY ./export/ .

RUN apk update && apk update && apk add supervisor

RUN apk add influxdb

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
    mkdir -p /etc/telegraf  && \
    mv ./telegraf.conf /etc/telegraf/telegraf.conf

VOLUME [ "/root/.influxdb" ]

VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 8086

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"] 