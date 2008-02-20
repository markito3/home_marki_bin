#!/usr/bin/perl -w
if ($ARGV[0]) {
    $format = $ARGV[0];
} else {
    $format = "+%Y-%m-%d:%H:%M";
}
$target_dir = "/u/scratch/marki/home/" . `date $format`;
chomp $target_dir;
$logfile = $target_dir . "/backup.log";
system "mkdir -p $target_dir";
$rsync_command = "rsync -ruvt --delete --exclude='Music/**' --exclude='.Trash/**' --exclude='.beagle/**' /home/marki $target_dir/";
#print "rsync_command = ", $rsync_command, "\n";
if (-e $logfile) {
    #print "$logfile exists\n";
    #print "mv $logfile ${logfile}.previous\n";
    system "mv $logfile ${logfile}.previous";
} else {
    #print "$logfile does not exist\n";
}
system "$rsync_command > $target_dir/backup.log";
exit 0;
