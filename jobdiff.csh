date
mv j.tmp j.old.tmp
jobstat -u all | sort -n > j.tmp
diff j.old.tmp j.tmp | grep \>
