#!/bin/sh

ssh-keygen -A

# /usr/sbin/sshd -D

#/usr/bin/supervisord -c /etc/supervisord.conf

nginx -g 'daemon off;'