#!/bin/tcsh -f
mail $1@jlab.org -s "Old files on the CLAS work disks" <<+
You have files on the CLAS work disks that have not been accessed in
more than three days. As a courtesy to others, please delete them if
you are not using them. They may be deleted automatically during the
next 24 hours.

You can locate the files using the "-atime" option of the UNIX "find"
command. For example:

  find /work/clas/disk1/. -user marki -atime +3

You can find a description of the auto-deletion algorithm at

  http://claspc2.cebaf.gov/~marki/online_html/cleanwork.html

This message was generated automatically.
+
exit
