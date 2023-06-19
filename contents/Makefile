NAME	 		= Inception
WORDPRESS_TAR	= wordpress-6.2.2-ja.tar
NGINX			= nginx/Dockerfile nginx/nginx.conf
MARIADB			= mariaDB/Dockerfile mariaDB/init.sh mariaDB/mariadb.conf
PHP				= php/Dockerfile php/conf/php-fpm.conf php/conf/php.ini php/conf/pool.d/www.conf
WORDPRESS		= wordpress/
DBDATA			= DBdata/
SSL_KEY			= nginx/blyu.42.fr.key
SSL_CSR			= nginx/blyu.42.fr.csr
SSL_CRT			= nginx/blyu.42.fr.crt
SAN				= san.txt

all : $(WORDPRESS) $(SSL_KEY) $(SSL_CRT) $(SAN)
	docker compose up &

$(WORDPRESS) : $(WORDPRESS_TAR)
	tar xvf $^

$(SSL_KEY) :
	openssl genrsa -out $@ 2048

$(SSL_CSR) : $(SSL_KEY)
	openssl req -out $@ -key $^ -new -nodes -subj "/C=JP/ST=Tokyo/L=Ropongi/CN=blyu.42.fr"

$(SSL_CRT) : $(SSL_KEY) $(SSL_CSR) $(SAN)
	openssl x509 -req -days 1 -signkey $(SSL_KEY) -in $(SSL_CSR) -out $@ -extfile $(SAN)

$(SAN) :
	echo 'subjectAltName = DNS:*.blyu.42.fr, DNS:blyu.42.fr' > $@

register_srt : $(SSL_CRT)
	sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" $^

clean : 
	rm -rf $(SSL_KEY) $(SSL_CSR) $(SSL_CRT) $(SAN)

fclean : clean
	docker compose down
	rm -rf $(WORDPRESS) $(DBDATA)
	docker compose rm

re : fclean all
