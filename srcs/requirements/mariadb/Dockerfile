FROM	debian:buster

RUN		apt-get -y update && apt-get -y upgrade
RUN		apt-get -y install mariadb-server

RUN		mkdir -p /var/run/mysqld && mkdir -p /run/mysqld
RUN		chown -R mysql:root var/run/mysqld && \
		chown -R mysql:root /run/mysqld

COPY	conf/50-server.cnf		/etc/mysql/mariadb.conf.d/50-server.cnf
COPY	conf/conf.sh conf.sh

EXPOSE 3306

ENTRYPOINT ["sh", "conf.sh"]
