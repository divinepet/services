FROM alpine:3.11.7

RUN apk update
RUN apk add --no-cache openrc nginx supervisor mysql mysql-client php7 php7-fpm php7-json php7-mysqli
RUN rc-update add php-fpm7 default

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz
RUN mv wordpress /var/www/wordpress
RUN rm -rf latest.tar.gz

COPY srcs/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY srcs/supervisor.conf /etc/supervisord.conf
COPY srcs/wp-config.php /var/www/wordpress/

RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php

EXPOSE 5050

COPY ./srcs/init_container.sh ./
RUN chmod +x init_container.sh
RUN mkdir -p /run/nginx 

CMD ["/init_container.sh"]