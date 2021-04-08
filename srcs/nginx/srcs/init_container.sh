#!/bin/sh

# setting access
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#rc default
#rc-service sshd start
ssh-keygen -A
#rc-service sshd stop
/usr/bin/supervisord -c /etc/supervisord.conf