#! /bin/tcsh -f
rm -f $SCR/work_use_sort_$1.tmp
sort -k 3 $SCR/work_use_$1.tmp > $SCR/work_use_sort_$1.tmp
rm $SCR/work_summary_$1.tmp
cat $SCR/work_use_sort_$1.tmp | work_use.perl | sort -nrk 1 \
    > $SCR/work_summary_$1.tmp
exit
