#!/bin/bash
if [ -d /var/lib/mysql_buff ]; then
    cp -rf /var/lib/mysql_buff/*  /var/lib/mysql/
    rm -rf /var/lib/mysql_buff
    chmod 777 /var/lib/mysql /var/lib/mysql/* /var/lib/mysql/*/* || true
    bash /setting.sh&
fi
exec mysqld
