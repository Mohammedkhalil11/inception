#!/bin/sh

#echo "hhhh";

service mysql start 

echo "CREATE DATABASE IF NOT EXISTS db ;" > db1.sql
echo "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'pass' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON db.* TO 'user'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql -u root< db1.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld