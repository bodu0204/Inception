NAME	 	= Inception
NGINX_DIR	= ./nginx/

nginx_image : $(NGINX_DIR)/Dockerfile
	docker image bulid $(NGINX_DIR) -t nginx_image

nginx : nginx_image
	docker image bulid $(NGINX_DIR)