#! /bin/tcsh -f
work_use_one.csh 1
work_use_one.csh 2
work_use_one.csh 3
cd $SCR
cat work_use_1.tmp work_use_2.tmp work_use_3.tmp > work_use_tot.tmp
work_use_sum.csh tot
'rm' work_report.tmp
echo "Work Disk Usage Summary" > work_report.tmp
echo "" >> work_report.tmp
echo "Sum of all three work disks:" >> work_report.tmp
cat work_summary_tot.tmp >> work_report.tmp
echo "" >> work_report.tmp
echo "/work/clas/disk1 only:" >> work_report.tmp
cat work_summary_1.tmp >> work_report.tmp
echo "" >> work_report.tmp
echo "/work/clas/disk2 only:" >> work_report.tmp
cat work_summary_2.tmp >> work_report.tmp
echo "" >> work_report.tmp
echo "/work/clas/disk3 only:" >> work_report.tmp
cat work_summary_3.tmp >> work_report.tmp
exit
