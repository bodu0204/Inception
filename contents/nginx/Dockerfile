FROM debian:buster
USER root
RUN /bin/bash -c ' \
apt update && apt upgrade -y && apt install -y nginx'
COPY ./nginx.conf /etc/nginx/
COPY ./localhost.crt /etc/ssl/certs/localhost.crt
COPY ./localhost.key /etc/ssl/private/localhost.key

ENTRYPOINT ["/bin/bash","-c"]
CMD ["nginx -g 'daemon off;' ;"]
