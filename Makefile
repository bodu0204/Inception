NAME	 		= Inception
WORDPRESS_TAR	= srcs/wordpress-6.2.2-ja.tar
NGINX			= srcs/nginx/Dockerfile nginx/nginx.conf
MARIADB			= srcs/mariaDB/Dockerfile mariaDB/init.sh mariaDB/mariadb.conf
PHP				= srcs/php/Dockerfile php/conf/php-fpm.conf php/conf/php.ini php/conf/pool.d/www.conf
WORDPRESS		= srcs/wordpress/
DBDATA			= srcs/DBdata/
SSL_KEY			= srcs/nginx/blyu.42.fr.key
SSL_CSR			= srcs/nginx/blyu.42.fr.csr
SSL_CRT			= srcs/nginx/blyu.42.fr.crt
SAN				= srcs/san.txt

all : $(WORDPRESS) $(DBDATA) $(SSL_KEY) $(SSL_CRT) $(SAN) register_dn
	cd srcs && docker compose up || true;

noerror : $(WORDPRESS) $(DBDATA) $(SSL_KEY) $(SSL_CRT) $(SAN) register_dn register_srt
	cd srcs && docker compose up || true;

$(WORDPRESS) : $(WORDPRESS_TAR)
	tar xvf $^ -C srcs/

$(DBDATA) :
	mkdir $@

$(SSL_KEY) :
	openssl genrsa -out $@ 2048

$(SSL_CSR) : $(SSL_KEY)
	openssl req -out $@ -key $^ -new -nodes -subj "/C=JP/ST=Tokyo/L=Ropongi/CN=blyu.42.fr"

$(SSL_CRT) : $(SSL_KEY) $(SSL_CSR) $(SAN)
	openssl x509 -req -days 30 -signkey $(SSL_KEY) -in $(SSL_CSR) -out $@ -extfile $(SAN)

$(SAN) :
	echo 'subjectAltName = DNS:*.blyu.42.fr, DNS:blyu.42.fr, DNS:*.localhost, DNS:localhost' > $@

register_srt : $(SSL_CRT)
	sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" $^

register_dn :
	grep 'blyu.42.fr' /etc/hosts || echo "127.0.0.1     blyu.42.fr" | sudo tee -a /etc/hosts

clean :
	rm -rf $(SSL_KEY) $(SSL_CSR) $(SSL_CRT) $(SAN)

fclean : clean
	cd srcs && docker compose down
	rm -rf $(WORDPRESS) $(DBDATA)
	docker image rm webserver fast-cgi database || true

re : fclean all
