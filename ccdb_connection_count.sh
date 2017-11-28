#!/bin/bash
mysql -hhallddb -uccdb_user information_schema -e 'select count(*) from processlist where user = "ccdb_user" and host like "farm%"'
