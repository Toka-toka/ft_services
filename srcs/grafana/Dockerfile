FROM alpine:3.12

COPY ./export/ .

RUN apk update && apk update && apk add supervisor

RUN apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
    mkdir /usr/share/grafana/data/ && \
    mv ./grafana.db /usr/share/grafana/data/

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
    mkdir -p /etc/telegraf  && \
    mv ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3000

CMD ["/usr/bin/supervisord", "-c", "/supervisord.conf"]