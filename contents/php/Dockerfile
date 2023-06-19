FROM debian:buster
USER root
RUN /bin/bash -c 'apt update && apt upgrade -y \
    && apt -y install lsb-release apt-transport-https ca-certificates wget\
    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list \
    && apt-get update && apt -y install php8.2-fpm php8.2-mysql'
COPY ./conf /etc/php/8.2/fpm/
COPY ./test.php /var/www/html/
RUN mkdir /run/php/

ENTRYPOINT ["/bin/bash","-c"]
CMD ["php-fpm8.2 -F;"]
