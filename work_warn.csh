#!/bin/tcsh -f
rm -f work_warn.tmp
foreach i ( 1 2 3 )
    work_warn_one.csh $i >> work_warn.tmp
end
sort work_warn.tmp | squeeze.perl | work_warn_mail.perl
exit
