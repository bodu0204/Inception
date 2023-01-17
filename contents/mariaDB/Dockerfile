FROM debian AS mariaDB_container
USER root
RUN /bin/bash -c 'apt update && apt upgrade -y \
&& apt install -y curl \
&& curl https://dlm.mariadb.com/2700598/MaxScale/22.08.3/packages/debian/buster/aarch64/maxscale-22.08.3-1.debian.buster.aarch64.deb -O'
ENTRYPOINT ["/bin/bash"]
#CMD []
