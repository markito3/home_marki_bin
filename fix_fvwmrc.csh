#! /bin/tcsh -f
/bin/rm -f .fvwm2rc95.local
sed -e "s/slogin/slogin -C/g" .fvwm2rc95 > .fvwm2rc95.local
exit
