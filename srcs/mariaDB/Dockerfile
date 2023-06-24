FROM debian:buster
USER root
RUN /bin/bash -c 'apt update && apt upgrade -y \
	&& apt install -y mariadb-server'
COPY ./mariadb.conf /etc/mysql/my.cnf
COPY ./docker-entrypoint.sh /
COPY ./setting.sh /
RUN /bin/bash -c 'mkdir /run/mysqld/ \
	&& chmod 777 /run/mysqld/ \
	&& chmod 100 /docker-entrypoint.sh \
	&& chmod 111 /setting.sh \
	&& cp -r /var/lib/mysql/ /var/lib/mysql_buff/ \
	&& rm -rf /var/lib/mysql/* \
'
CMD ["/docker-entrypoint.sh"]
