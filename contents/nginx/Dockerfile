FROM debian AS nginx_container
USER root
RUN /bin/bash -c 'apt update && apt upgrade -y \
&& apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring sudo \
&& curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null \
&& echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    | tee /etc/apt/sources.list.d/nginx.list \
&& echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
    | tee /etc/apt/preferences.d/99nginx \
&& apt update && apt install -y nginx'
CMD [ "/bin/bash", "-c", "nginx" ]
