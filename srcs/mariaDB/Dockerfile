FROM debian:buster
USER root
RUN /bin/bash -c 'apt update && apt upgrade -y \
	&& apt install -y mariadb-server'
COPY ./mariadb.conf /etc/mysql/my.cnf
COPY ./docker-entrypoint.sh /
COPY ./setting.sh /
RUN ["mkdir", "/run/mysqld/"]
RUN ["chmod", "777", "/run/mysqld/"]
RUN ["chmod", "100", "/docker-entrypoint.sh"]
RUN ["chmod", "111", "/setting.sh"]
RUN ["cp", "-r" , "/var/lib/mysql/", "/var/lib/mysql_buff/"]
CMD ["/docker-entrypoint.sh"]
