#!/usr/bin/env perl
$path = $ARGV[0];
@parts = split(/\//, $path);
$file = $parts[$#parts];
$tempfile = "/tmp/" . $file . ".tmp";
system("cp $file $tempfile");
system("chmod a-w $tempfile");
system("emacs $tempfile");
exit;
