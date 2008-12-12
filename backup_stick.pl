#!/usr/bin/perl -w
#
$target_dir = "/home/marki/USB/documents/work";
system "mkdir -p $target_dir";
$rsync_command = "rsync -ruvtc --delete";
$rsync_command .= " /home/marki/Documents";
$rsync_command .= " $target_dir/";
$logfile = $target_dir . "/backup.log";
if (-e $logfile) {
    #print "$logfile exists\n";
    #print "mv $logfile ${logfile}.previous\n";
    system "mv $logfile ${logfile}.previous";
} else {
    #print "$logfile does not exist\n";
}
#print "rsync_command = ", $rsync_command, "\n";
system "$rsync_command > $target_dir/backup.log";
exit 0;
