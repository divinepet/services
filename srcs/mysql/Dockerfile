FROM alpine:3.11.7

RUN apk update && apk upgrade
RUN apk add --no-cache mysql mysql-client openrc

RUN mkdir -p /data/mysql
RUN chmod +x /data

COPY srcs/wppp.sql /
RUN chmod +x /wppp.sql

RUN mkdir -p /etc/mysql/mysql.conf.d
COPY srcs/mydb.cnf /etc/mysql/my.cnf

EXPOSE 3306

COPY ./srcs/mysql_new.sh ./
RUN chmod 777 ./mysql_new.sh

CMD ["/mysql_new.sh"]