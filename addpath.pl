#!/usr/bin/env perl
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
# Options
#
# -e: add path names to the end of the path.
#
if ($ARGV[0] eq '-e') {
    $add_to_end = 1;
    shift @ARGV;
} else {
    $add_to_end = 0;
}
if ($ARGV[0] eq '-l') {
    $pathtype = "LD_LIBRARY_PATH";
    shift @ARGV;
} else {
    $pathtype = "PATH";
}
$line=$ENV{$pathtype};
@field = split(/:/,$line);
$newpath = $line;
for($i = $#ARGV; $i >= 0; $i--) {
  $exists = 0;
  for ($j = 0; !$exists && $j <= $#field ; $j++) {
    $path = $field[$j];
    if ($path eq $ARGV[$i]) {
      $exists = 1;
    }
  }
  if (!$exists) {
      if ($add_to_end) {
	  $newpath = $newpath . ":" . $ARGV[$i];
      } else {
	  $newpath = $ARGV[$i] . ":" . $newpath;
      }
  }
}
print "setenv $pathtype $newpath\n";
exit
