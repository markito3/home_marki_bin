#!/bin/csh
mail -s notification $USER <<+
the job is done
+
echo mail notification sent to $USER
exit
