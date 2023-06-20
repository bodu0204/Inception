FROM debian:buster
USER root
RUN /bin/bash -c ' \
apt update && apt upgrade -y && apt install -y nginx'
COPY ./nginx.conf /etc/nginx/
COPY ./blyu.42.fr.crt /etc/ssl/certs/
COPY ./blyu.42.fr.key /etc/ssl/private/

CMD ["nginx","-g","daemon off;"]
