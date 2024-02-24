#!/bin/bash

envsubst '$DOMAIN_NAME $CERTS_ $KEY_' < nginx.template > /etc/nginx/nginx.conf
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $KEY_ -out $CERTS_ -subj "/C=MO/L=BG/O=1337/OU=student/CN=mokhalil.42.ma"

nginx -g "daemon off;"