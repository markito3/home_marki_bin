#!/bin/bash
mysql -hhallddb -umarki -phybrid information_schema -e 'select user, count(*) from processlist group by user'
mysql -hhallddb -uccdb_user information_schema -e 'select count(*) from processlist where user = "ccdb_user" and host like "farm%"'
