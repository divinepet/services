FROM alpine:3.11.7

RUN apk update && apk upgrade
RUN apk add vsftpd openrc openssl
RUN rc-update add vsftpd default

EXPOSE 20 21 14888

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=RU/ST=Kazan/L=Kazan City/O=School21/OU=elaronda Inc/CN=mainserver"

RUN echo "/usr/sbin/nologin" >> /etc/shell
RUN mkdir -p /var/ftp_home
RUN adduser --home=/var/ftp_home -D elaronda
RUN echo "elaronda:elaronda" | chpasswd
RUN chmod +x /var/ftp_home
RUN chown -R elaronda:elaronda /var/ftp_home
RUN chown -R "elaronda:elaronda" /var/ftp_home

RUN chown -R elaronda /var/ftp_home

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

ENTRYPOINT vsftpd /etc/vsftpd/vsftpd.conf