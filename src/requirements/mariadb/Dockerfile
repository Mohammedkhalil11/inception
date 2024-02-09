FROM debian:buster

RUN apt update && apt upgrade -y
#RUN apt install systemctl 
RUN apt install mariadb-server -y

#COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

ADD tools/cnf.sh .
RUN chmod 755 cnf.sh

#CMD [ "./cnf.sh" ]
