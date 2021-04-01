#!/bin/sh

rc default
/etc/init.d/mariadb setup
rc-service mariadb start
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'sedric'@'%' IDENTIFIED BY 'sedric';"  | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'sedric'@'%';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql wordpress -u root --password= < ./wordpress.sql
rc-service mariadb stop
/usr/bin/supervisord -c ./supervisord.conf