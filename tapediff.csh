date
mv t.tmp t.old.tmp
silo_status.pl no_priority=true > t.tmp
diff t.old.tmp t.tmp | grep \> | grep -v username | grep -v "\-\-\-"
