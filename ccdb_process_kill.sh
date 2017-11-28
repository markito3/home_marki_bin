#!/bin/bash
mysql -s -hhallddb -umarki -p******** information_schema -e 'select id, host, command from PROCESSLIST where user = "ccdb_user" and host like "farm%" order by host;'
mysql -s -hhallddb -umarki -p******** information_schema -e 'select concat("kill ",id," ; ") from PROCESSLIST where user = "ccdb_user" and host like "farm%";' > ! a.tmp
mysql -s -hhallddb -umarki -p******** information_schema < a.tmp
