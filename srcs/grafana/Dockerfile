FROM alpine:3.11.7

RUN apk update
RUN apk add openrc wget libc6-compat

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.2.linux-amd64.tar.gz
RUN tar -xf grafana-enterprise-7.5.2.linux-amd64.tar.gz
RUN mv grafana-7.5.2 grafana
RUN chmod +x -R grafana
RUN mv grafana/bin/grafana-server /usr/local/bin

COPY srcs/grafana.db /grafana/data/grafana.db

EXPOSE 3000

COPY ./srcs/init.sh ./
RUN chmod +x init.sh

CMD ["/init.sh"]