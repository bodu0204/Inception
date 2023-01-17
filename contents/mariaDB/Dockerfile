FROM debian AS mariaDB_container
USER root
RUN /bin/bash -c 'apt update && apt upgrade -y \
&& apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring \
&& curl https://mariadb.com/download-confirmation?group-name=Community%20Server&release-notes-uri=https%3A%2F%2Fmariadb.com%2Fkb%2Fen%2Fmariadb-10-10-2-release-notes%2F&documentation-uri=https%3A%2F%2Fmariadb.com%2Fkb%2Fen%2Fwhat-is-mariadb-1010%2F&download-uri=https%3A%2F%2Fdlm.mariadb.com%2F2686691%2FMariaDB%2Fmariadb-10.10.2%2Frepo%2Fdebian%2Fmariadb-10.10.2-debian-bullseye-arm64-debs.tar&product-name=Community%20Server&download-size=53.94%20MB -O'
ENTRYPOINT ["/bin/bash"]
#CMD []
