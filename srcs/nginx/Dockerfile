FROM alpine:3.11.7

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor

#НАСТРОЙКА NGINX
COPY ./srcs/nginx-localhost /etc/nginx/conf.d/default.conf
#НАСТРОЙКА SUPERVISORD
COPY ./srcs/supervisor.conf /etc/supervisord.conf

#НАСТРОЙКА SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=RU/ST=Kazan/L=Kazan City/O=School21/OU=elaronda Inc/CN=mainserver"

COPY ./srcs/index.html /var/www/

EXPOSE 80 443

COPY ./srcs/init_container.sh ./
RUN chmod +x init_container.sh
RUN mkdir -p /run/nginx 

CMD ["/init_container.sh"]