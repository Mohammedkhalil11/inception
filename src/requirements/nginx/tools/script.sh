#!/bin/bash


openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/ssll.key -out /etc/nginx/ssl/ssll.crt -subj "/C=MO/L=BG/O=1337/OU=student/CN=mokhalil.42.ma"

nginx -g "daemon off;"