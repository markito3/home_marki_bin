#!/bin/tcsh -f
mail $1@jlab.org -s "CLAS work disk usage" <<+
You have files on the CLAS work disks that have not been accessed in
more than three days. Please delete them if you are not using them.
They may be deleted automatically during the next 24 hours.

You can locate the files using the "-atime" option of the UNIX "find"
command.

You can find a description of the auto-deletion algorithm at

  http://claspc2.cebaf.gov/~marki/online_html/cleanwork.html

This message was generated automatically.
+
exit
