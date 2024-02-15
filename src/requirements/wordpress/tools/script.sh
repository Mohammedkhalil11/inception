#!/bin/bash

mkdir -p /var/www/html/
chmod -R 775 /var/www/html
chown -R www-data /var/www/html
wget http://wordpress.org/latest.tar.gz > /dev/null
tar xfz latest.tar.gz
chown -R www-data wordpress/*
chmod 755 wordpress/*
mv -f wordpress/* /var/www/html/
#rm -rf wp-config-sample.php
cp wp-config.php	/var/www/html/
rm -rf latest.tar.gz
rm -rf wordpress
#cd /var/www/html
#wp core install --allow-root --url=mokhalil.42.com --title=sba3 --admin_user=amdin --admin_password=amdin_passwd --admin_email=mohammed.khalil@gmail.com
#wp user create db_user  mohammed.khalil@gmail.com --user_pass=user_passwd --role=author --allow-root
#wp theme install inspiro --activate --allow-root
#cd 
/usr/sbin/php-fpm7.4 -F