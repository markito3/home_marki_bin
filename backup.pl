#!/usr/bin/perl -w
if ($ARGV[0]) {
    $format = $ARGV[0];
} else {
    $format = "+%Y-%m-%d:%H:%M";
}
$target_dir = "/u/scratch/marki/home/" . `date $format`;
chomp $target_dir;
#print "target_dir = $target_dir\n";
$logfile = $target_dir . "/backup.log";
system "mkdir -p $target_dir";
$rsync_command = "rsync -ruvt --delete";
$rsync_command .= " --exclude='Music/**'";
$rsync_command .= " --exclude='.Trash/**'";
$rsync_command .= " --exclude='.local/share/Trash/**'";
$rsync_command .= " --exclude='.beagle/**'";
$rsync_command .= " --exclude='.mozilla/**'";
$rsync_command .= " --exclude='.thunderbird/**'";
$rsync_command .= " --exclude='.gnome*/**'";
$rsync_command .= " --exclude='.gconf*/**'";
$rsync_command .= " --exclude='.openoffice.org*/**'";
$rsync_command .= " --exclude='.kde/**'";
$rsync_command .= " --exclude='.java/**'";
$rsync_command .= " --exclude='.thumbnails/**'";
$rsync_command .= " --exclude='.macromedia/**'";
$rsync_command .= " --exclude='.gvfs'";
$rsync_command .= " /home/marki $target_dir/";
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
