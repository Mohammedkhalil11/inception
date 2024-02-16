#!/bin/bash

if [ -d /var/lib/mysql/db ]
then
    echo "data base already exist"
else

    service mariadb start
    sleep 2
    mariadb -e "CREATE DATABASE IF NOT EXISTS db ;"
    mariadb -e "CREATE USER IF NOT EXISTS 'db_user'@'%' IDENTIFIED BY 'user_passwd' ;" 
    mariadb -e "GRANT ALL PRIVILEGES ON db.* TO 'db_user'@'%' ;" 

    mariadb -e "FLUSH PRIVILEGES;" 
    service mariadb stop
fi
mysqld_safe
 