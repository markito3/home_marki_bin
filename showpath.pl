#!/usr/bin/env perl
if ($ARGV[0]) {
    $line=$ENV{'LD_LIBRARY_PATH'};
} else {
    $line=$ENV{'PATH'};
}
#print "$line\n";
@field = split(/:/,$line);
print "number of fields $#field\n";
foreach $path (@field) {
  print "$path\n";
}
exit
