FROM debian:buster
USER root
RUN /bin/bash -c ' \
apt update && apt upgrade -y && apt install -y php-fpm php-mysql\
'
COPY ./php-fpm.conf /etc/php/7.4/fpm/
COPY ./test.php /var/www/html/dir

ENTRYPOINT ["/bin/bash","-c"]
CMD ["php-fpm7.4 -F;"]
