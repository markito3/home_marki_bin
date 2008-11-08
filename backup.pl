#!/usr/bin/perl -w
use Getopt::Std;
$opt_t = ""; # set opt variables to avoid warnings
$opt_s = "";
$opt_d = "";
getopts('t:s:d:');
$type = $opt_t;
$source = $opt_s;
$dest = $opt_d;
if ($type eq 'one_time') {
    $format = "+%Y-%m-%d:%H:%M";
} elsif ($type eq 'minute') {
    $format = "+:%M";
} elsif ($type eq 'hour_minute') {
    $format = "+%H:%M";
} elsif ($type eq 'day_of_week') {
    $format = '+%a';
} elsif ($type eq 'day_of_month') {
    $format = '+%d';
} elsif ($type eq 'month') {
    $format = '+%b';
} else {
    print STDERR "bad format for type, $type\n";
    exit 1;
}
$target_dir = $dest . '/' . `date $format`;
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
$rsync_command .= " --exclude='.mozilla-thunderbird/**'";
$rsync_command .= " --exclude='.gnome*/**'";
$rsync_command .= " --exclude='.gconf*/**'";
$rsync_command .= " --exclude='.openoffice.org*/**'";
$rsync_command .= " --exclude='.kde/**'";
$rsync_command .= " --exclude='.java/**'";
$rsync_command .= " --exclude='.thumbnails/**'";
$rsync_command .= " --exclude='.macromedia/**'";
$rsync_command .= " --exclude='.gvfs'";
$rsync_command .= " --exclude='.metacity'";
$rsync_command .= " --exclude='.nautilus'";
$rsync_command .= " --exclude='.openoffice'";
$rsync_command .= " --exclude='.dbus'";
$rsync_command .= " --exclude='.evolution'";
$rsync_command .= " --exclude='.wapi'";
$rsync_command .= " --exclude='.tomboy/addin*'";
$rsync_command .= " --exclude='Documents_work/**'";
$rsync_command .= " $source $target_dir/";
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
