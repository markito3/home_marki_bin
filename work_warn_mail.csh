#!/bin/tcsh -f
mail $1@jlab.org -s "CLAS work disk usage" <<+
You have files on the CLAS work disks that have not been accessed in
more than three days. Please delete them if you are not using them.
They may be deleted automatically during the next 24 hours.

This message was generated automatically.
+
exit
