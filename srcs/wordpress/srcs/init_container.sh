#!/bin/sh

# setting access
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

/usr/bin/supervisord -c /etc/supervisord.conf