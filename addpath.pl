#!/usr/local/bin/perl
#
# Written so that:
#
# o it can be put in .cshrc
# o repeated invocations do not add paths that already exist
# o an invocation will not eliminate paths that already exist
# 
# This results in a consistent path, regardless of how far down you are
# in the process stack.
#
$line=$ENV{'PATH'};
#print "$line\n";
@field = split(/:/,$line);
#print "number of fields $#field\n";
#print "number of new fields $#ARGV\n";
$newpath = $line;
for($i = $#ARGV; $i >= 0; $i--) {
  #print "$i $ARGV[$i]\n";
  $exists = 0;
  for ($j = 0; !$exists && $j <= $#field ; $j++) {
    $path = $field[$j];
    #print "$j $path\n";
    if ($path eq $ARGV[$i]) {
      $exists = 1;
    }
  }
  if (!$exists) {$newpath = $ARGV[$i] . ":" . $newpath;}
}
print "setenv PATH $newpath\n";
exit
