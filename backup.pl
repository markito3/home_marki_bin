#!/usr/bin/perl -w
$format = $ARGV[0];
$target_dir = "/u/scratch/marki/home/`date $format`/";
system "mkdir -p $target_dir";
$rsync_command = "rsync -ruv --exclude='Music/**' /home/marki $target_dir";
print "rsync_command = ", $rsync_command, "\n";
system $rsync_command;
exit 0;
