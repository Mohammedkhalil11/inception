FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt install mariadb-server mariadb-client -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
ADD tools/c.sh .
RUN chmod 755 c.sh
CMD ["./c.sh"]
