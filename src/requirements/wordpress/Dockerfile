FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y php php-cgi php-mysql php-fpm \
    php-pdo php-gd php-cli php-mbstring mariadb-client \
    curl wget && mkdir -p /run/php/ && mkdir -p /var/www/html/
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod 775 wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
COPY conf/www.conf  /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/script.sh .
COPY conf/wp-config.php	.
RUN chmod 755 script.sh
CMD ["./script.sh"]
