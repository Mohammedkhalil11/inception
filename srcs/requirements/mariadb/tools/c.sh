#!/bin/bash

if [ -d /var/lib/mysql/$MDB_DATABASE_NAME ]
then
    echo "data base already exist"
else

    service mariadb start
    sleep 1
    mariadb -e "CREATE DATABASE IF NOT EXISTS $MDB_DATABASE_NAME;"
    mariadb -e "CREATE USER IF NOT EXISTS '$MDB_USER'@'%' IDENTIFIED BY '$MDB_PASSWORD';" 
    mariadb -e "GRANT ALL PRIVILEGES ON $MDB_DATABASE_NAME.* TO '$MDB_USER'@'%';" 
    mariadb -e "FLUSH PRIVILEGES;" 
    service mariadb stop
fi
mysqld_safe
 