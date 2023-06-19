FROM debian:buster
USER root
RUN /bin/bash -c 'apt update && apt upgrade -y \
	&& apt install -y mariadb-server procps'
COPY ./mariadb.conf /etc/mysql/my.cnf
COPY ./init.sh /
RUN ["mkdir", "/run/mysqld/"]
RUN ["chmod", "777", "/run/mysqld/"]
RUN ["chmod", "100", "/init.sh"]
RUN ["cp", "-r" , "/var/lib/mysql/", "/var/lib/mysql_buff/"]
ENTRYPOINT ["/bin/bash","-c"]
CMD ["bash /init.sh"]
