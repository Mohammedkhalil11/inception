#!/bin/bash

if [ -f /var/www/html/wp-config.php ]
then
    echo "wordpress site already exist"
else

    chmod -R 755 /var/www/html
    chown -R www-data /var/www/html
    cd /var/www/html
    wp core download --allow-root
    wp config create --allow-root --dbname=db --dbuser=db_user --dbpass=user_passwd --dbhost=mariadb
    wp core install --allow-root --url=mokhalil.42.com --title=sba3 --admin_user=amdin --admin_password=amdin_passwd --admin_email=mokhalil@student.1337.ma
    wp user create wr_user  mokhalil@student.1337.ma --user_pass=userwr_passwd --role=author --allow-root
fi    
/usr/sbin/php-fpm7.4 -F