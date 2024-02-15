FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install nginx -y && apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
COPY tools/script.sh .
RUN chmod 755 script.sh
COPY conf/nginx.conf /etc/nginx/nginx.conf
CMD [ "./script.sh" ]
