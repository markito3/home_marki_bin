#!/bin/tcsh -f
mail $1@jlab.org -s "Old files on the CLAS work disks" <<+
You have files on the CLAS work disks that have not been accessed in
more than five days. As a courtesy to others, please delete them if
you are not using them. They may be deleted automatically during the
next 48 hours.

You can locate the files using the "-atime" option of the UNIX "find"
command. For example:

  find /work/clas/disk1/. -user marki -atime +4

or

  find /work/clas/disk2/. -user marki -atime +4

or

  find /work/clas/disk3/. -user marki -atime +4

where the +4 means more than 4+1 = 5 days. 

This message was generated automatically.
+
exit
