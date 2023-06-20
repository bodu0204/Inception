#!/bin/bash
mysql -u root -e "" > /dev/null 2>&1
while [ $? -ne 0 ]; do
    mysql -u root -e "" > /dev/null 2>&1
done
mysql -u root -e "CREATE DATABASE $DB_NAME;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASS' WITH GRANT OPTION;"
