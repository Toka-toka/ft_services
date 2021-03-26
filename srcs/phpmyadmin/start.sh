rc default
rc-update add nginx default
rc-update add php-fpm7 default

/usr/bin/supervisord -c /etc/supervisord.conf