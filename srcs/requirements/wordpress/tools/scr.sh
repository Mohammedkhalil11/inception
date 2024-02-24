#!/bin/bash

if [ -f /var/www/html/wp-config.php ]
then
    echo "wordpress site already exist"
else

    chmod -R 755 /var/www/html
    chown -R www-data /var/www/html
    sleep 5
    cd /var/www/html
    #download worpress site using wp command
    wp core download --allow-root
    #configure worpress site to connect with database
    wp config create --allow-root --dbname=${WPRESS_DB_NAME} --dbuser=${WPRESS_DB_USER} --dbpass=${WPRESS_DB_PASSWD} --dbhost=${WPRESS_DB_HOST}
    #install worpress site core
    wp core install --allow-root --url=${DOMAIN_NAME} --title=${WPRESS_TITLE} --admin_user=${WPRESS_ADM_USR} --admin_password=${WPRESS_ADM_PASSWD} --admin_email=${WPRESS_ADM_EMAIL}
    #create wordpress user using wp command
    wp user create "${WPRESS_USR_NAME}" "${WPRESS_ADM_EMAIL}" --user_pass="${userwr_passwd}" --role=author --allow-root

fi
#running php-fpm in forground 
/usr/sbin/php-fpm7.4 -F