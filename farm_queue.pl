#!/usr/local/bin/perl
open(JS, "/site/bin/jobstat -u all | grep ' production ' | wc |");
$info = <JS>;
chop $info;
@field = split(/\s+/, $info);
#print "0=$field[0] 1=$field[1] 2=$field[2]\n";
$nreqs = $field[1];
print time(), " $nreqs\n";
exit 0;
