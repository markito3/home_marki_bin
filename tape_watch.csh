#!/bin/tcsh -f
mv tape.tmp tape.old.tmp
date
jtsstat > tape.tmp
diff tape.old.tmp tape.tmp
exit
