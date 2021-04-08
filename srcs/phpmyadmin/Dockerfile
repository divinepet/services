FROM alpine:3.11.7

RUN apk update
RUN apk add --no-cache  openrc nginx supervisor wget mysql mysql-client php7 php7-fpm php7-json php7-mysqli php7-curl php7-gd php7-intl php7-mbstring php7-soap php7-xml php7-xmlrpc php7-zip php7-iconv php7-phar php7-session
RUN rc-update add php-fpm7 default

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz
RUN tar -xf phpMyAdmin-5.1.0-all-languages.tar.gz
RUN mv phpMyAdmin-5.1.0-all-languages phpmyadmin
RUN mv phpmyadmin /var/www/
RUN rm -rf phpMyAdmin-5.1.0-all-languages.tar.gz

COPY srcs/config.inc.php /var/www/phpmyadmin/config.inc.php
COPY srcs/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY srcs/supervisor.conf /etc/supervisord.conf

RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php

EXPOSE 5000

COPY ./srcs/init_container.sh ./
RUN chmod +x init_container.sh
RUN mkdir -p /run/nginx 

CMD ["/init_container.sh"]