#! /bin/sh
rm -f /tmp/crondiff.tmp
crontab -l | grep -v 'DO NOT EDIT' | grep -v 'installed on' | \
    grep -v 'Cron version' > /tmp/crondiff.tmp
echo diff /home/marki/misc/crontab.txt crontab
diff /home/marki/misc/crontab.txt /tmp/crondiff.tmp 
exit
