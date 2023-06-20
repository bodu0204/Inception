#!/bin/bash
if [ -d /var/lib/mysql_buff ]; then
    cp -rf /var/lib/mysql_buff/*  /var/lib/mysql/
    rm -rf /var/lib/mysql_buff
    chmod 777 /var/lib/mysql /var/lib/mysql/* /var/lib/mysql/*/* || true
    mysqld_safe > /dev/null 2>&1 &
    mysql -u root -e "" > /dev/null 2>&1
    while [ $? -ne 0 ]; do
        mysql -u root -e "" > /dev/null 2>&1
    done
    mysql -u root -e "CREATE DATABASE wordpress;"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'wordpress'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;"
else
    mysqld_safe > /dev/null 2>&1 &
fi
tail -f /var/log/mysql/mysql.log
