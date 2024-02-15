#!/bin/bash

mkdir -p /var/www/html/
chmod -R 755 /var/www/html
chown -R www-data /var/www/html
wget http://wordpress.org/latest.tar.gz > /dev/null
tar xfz latest.tar.gz
chown -R www-data wordpress/*
chmod 755 wordpress/*
mv -f wordpress/* /var/www/html/
#rm -rf wp-config-sample.php
#cp -u wp-config.php	/var/www/html/wp-config-sample.php
cp wp-config.php /var/www/html/
rm -rf latest.tar.gz
rm -rf wordpress
cd /var/www/html
wp core install --allow-root --url=mokhalil.42.com --title=sba3 --admin_user=amdin --admin_password=amdin_passwd --admin_email=mokhalil@student.1337.ma
wp user create wr_user  mokhalil@student.1337.ma --user_pass=userwr_passwd --role=author --allow-root

#wp theme install inspiro --activate --allow-root
#cd 
/usr/sbin/php-fpm7.4 -F