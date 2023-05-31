FROM debian
USER root
RUN /bin/bash -c ' \
apt update && apt upgrade -y && apt install -y nginx php-fpm \
'
COPY ./nginx.conf /etc/nginx/
COPY ./php-fpm.conf /etc/php/7.4/fpm/
COPY ./test.php /var/www/html

ENTRYPOINT ["/bin/bash","-c"]
CMD ["php-fpm7.4 ; nginx -g 'daemon off;' ;"]
