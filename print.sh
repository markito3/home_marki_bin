#! /bin/sh
cp $1 /u/scratch/marki
ssh jlabs1 lp -d phyhp9 /u/scratch/marki/$1
exit
# end of shell script
