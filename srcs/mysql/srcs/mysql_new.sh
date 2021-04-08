#!/bin/sh

rc default
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE my_db;
CREATE USER 'root'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON my_db.* TO 'root';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

mysql -uroot my_db < wppp.sql

/etc/init.d/mariadb stop
exec /usr/bin/mysqld_safe