#! /bin/tcsh -f
rm -f $SCR/user_use.tmp
find . -type f -exec ls -l {} \; > $SCR/user_use.tmp
rm -f $SCR/user_use_sort.tmp
sort -k 3 $SCR/user_use.tmp > $SCR/user_use_sort.tmp
rm -f $SCR/user_summary.tmp
cat $SCR/user_use_sort.tmp | work_use.perl | sort -nrk 1 \
    > $SCR/user_summary.tmp
exit
