#!/usr/local/bin/perl
$line=$ENV{'PATH'};
#print "$line\n";
@field = split(/:/,$line);
print "number of fields $#field\n";
foreach $path (@field) {
  print "$path\n";
}
exit
