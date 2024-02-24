FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install nginx -y && apt install openssl -y
RUN apt install gettext-base -y
RUN mkdir -p /etc/nginx/ssl
COPY tools/script.sh .
RUN chmod 755 script.sh
COPY conf/nginx.template .
CMD [ "./script.sh" ]
