date
mv t.tmp t.old.tmp
jtsstat > t.tmp
diff t.old.tmp t.tmp | grep \>
