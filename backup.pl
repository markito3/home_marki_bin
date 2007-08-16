#!/usr/bin/perl -w
$target_dir = "/u/scratch/marki/home/`date_fixed.pl`/";
system "mkdir -p $target_dir";
$rsync_command = "rsync -ruv --exclude='marki/Music/**' /home $target_dir";
print "rsync_command = ", $rsync_command, "\n";
system $rsync_command;
exit 0;
