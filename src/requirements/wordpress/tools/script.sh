#!/bin/bash

if [ -f /var/www/html/wp-config.php ]
then
    echo "wordpress site already exist"
else

    chmod -R 755 /var/www/html
    chown -R www-data /var/www/html
    sleep 4
    cd /var/www/html
    #download worpress site using wp command
    wp core download --allow-root
    #configure worpress site to connect with database
    wp config create --allow-root --dbname=db --dbuser=db_user --dbpass=user_passwd --dbhost=mariadb
    #install worpress site core
    wp core install --allow-root --url=mokhalil@student.1337.com --title=sba3 --admin_user=amdin --admin_password=amdin_passwd --admin_email=mokhalil@student.1337.ma
    #create wordpress user using wp command
    wp user create wr_user  mokhalil@student.1337.ma --user_pass=userwr_passwd --role=author --allow-root
fi
#running php-fpm in forground 
/usr/sbin/php-fpm7.4 -F