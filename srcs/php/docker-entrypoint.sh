#!/bin/bash
chmod 777 /var/www/html/ /var/www/html/* /var/www/html/*/* || true;
exec php-fpm8.2 -F;