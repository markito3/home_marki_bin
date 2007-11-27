#!/usr/bin/perl -w
if ($ARGV[0]) {
    $format = $ARGV[0];
} else {
    $format = "+%Y-%m-%d:%H:%M";
}
$target_dir = "/u/scratch/marki/home/`date $format`";
system "mkdir -p $target_dir";
$rsync_command = "rsync -ruvt --delete --exclude='Music/**' --exclude='Download/**' --exclude='.*/**' /home/marki $target_dir/";
#print "rsync_command = ", $rsync_command, "\n";
system "mv $target_dir/backup.log $target_dir/backup.log.previous";
system "$rsync_command > $target_dir/backup.log";
exit 0;
