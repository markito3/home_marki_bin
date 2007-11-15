#!/usr/bin/perl -w
$format = $ARGV[0];
$target_dir = "/u/scratch/marki/home/`date $format`";
system "mkdir -p $target_dir";
$rsync_command = "rsync -ruv --exclude='Music/**' --exclude='Download/**' --exclude='.*/**' /home/marki $target_dir/";
#print "rsync_command = ", $rsync_command, "\n";
system "mv $target_dir/backup.log $target_dir/backup.log.previous";
system "$rsync_command > $target_dir/backup.log";
exit 0;
