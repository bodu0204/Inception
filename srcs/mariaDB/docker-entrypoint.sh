#!/bin/bash
if [ ! -d /var/lib/mysql/$DB_NAME ]; then
    cp -rf /var/lib/mysql_buff/*  /var/lib/mysql/
    bash /setting.sh&
fi
if [ -d /var/lib/mysql_buff ]; then
    rm -rf /var/lib/mysql_buff
fi
chmod 777 /var/lib/mysql /var/lib/mysql/* /var/lib/mysql/*/* || true
exec mysqld