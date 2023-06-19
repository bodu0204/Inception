#!/bin/bash
mysqld_safe > /dev/null 2>&1 &
if [ ! -d /var/lib/mysql/wordpress ]; then
    mysql -u root -e "" > /dev/null 2>&1
    while [ $? -ne 0 ]; do
        mysql -u root -e "" > /dev/null 2>&1
    done
    mysql -u root -e "CREATE DATABASE wordpress;"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;"
fi
tail -f /var/log/mysql/mysql.log
