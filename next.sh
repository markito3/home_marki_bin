 #!/bin/sh
rm -f /tmp/a.tmp /tmp/b.tmp /tmp/c.tmp
ssh -t ifarm jobstat | gawk '{print $1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "$12}' | sort > /tmp/a.tmp
sleep 300
ssh -t ifarm jobstat | gawk '{print $1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "$12}' | sort > /tmp/b.tmp
diff /tmp/a.tmp /tmp/b.tmp > /tmp/c.tmp
xterm -e less /tmp/c.tmp &
