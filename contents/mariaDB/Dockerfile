FROM debian:buster
USER root
RUN /bin/bash -c 'apt update && apt upgrade -y \
	&& apt install -y mariadb-server'
COPY ./mariadb.conf /etc/mysql/mariadb.cnf
COPY ./DBinit.sh /
RUN ["chmod", "755", "/DBinit.sh"]
RUN ["/bin/bash","/DBinit.sh"]
RUN ["rm", "/DBinit.sh"]
ENTRYPOINT ["/bin/bash","-c"]
CMD ["mysqld_safe --foreground --user=mysql"]
