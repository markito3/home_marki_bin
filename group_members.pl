perl -n -e 'chomp; @t = split/, /; print "number of fields = $#t\n"; for ($i = 0; $i <= $#t; $i++) {print "# $t[$i]\n"}' < halld.txt | sort > halld_wiki.txt
