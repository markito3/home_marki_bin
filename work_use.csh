#! /bin/tcsh -f
#
# Get info for each disk
#
work_use_one.csh 1
work_use_one.csh 2
work_use_one.csh 3
#
# cat the results together
#
cd $SCR
cat work_use_1.tmp work_use_2.tmp work_use_3.tmp > work_use_tot.tmp
#
# process for pan disk summary
#
work_use_sum.csh tot
#
# make final report file
#
rm -f work_report.tmp
echo "Work Disk Usage Summary" > work_report.tmp
date >> work_report.tmp # put in the date
echo "" >> work_report.tmp
df /work/clas/disk* >> work_report.tmp # put in the df disk usage info
echo "" >> work_report.tmp
echo "Sum of all work disks:" >> work_report.tmp
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
