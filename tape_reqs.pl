#!/usr/local/bin/perl
open(TS, "/site/bin/jtsstat | wc |");
$info = <TS>;
chop $info;
@field = split(/\s+/, $info);
$nreqs = $field[1];
print time(), " $nreqs\n";
exit 0;
