#!/usr/bin/perl -w
use Getopt::Std;
$opt_t = ""; # set opt variables to avoid warnings
$opt_s = "";
$opt_d = "";
$opt_h = "";
$opt_e = "";
getopts('t:s:d:he:');
$type = $opt_t;
$source = $opt_s;
$dest = $opt_d;
$help = $opt_h;
$exe_command = $opt_e;
if ($help) {
    print <<EOM;
valid type options are:
one_time, one_time_no_date, minute, hour_minute, day_of_week, day_of_month, month 
EOM
exit;
}
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
} elsif ($type eq 'one_time_no_date') {
    $format = 'undefined';
} else {
    print STDERR "bad format for type, $type\n";
    exit 1;
}
if ($type eq 'one_time_no_date') {
    $target_dir = $dest;
} else {
    $target_dir = $dest . '/' . `date $format`;
}
if ($exe_command) {$e_option = "-e \'$exe_command\'";} else {$e_option = "";}
chomp $target_dir;
#print "target_dir = $target_dir\n";
$logfile = $target_dir . "/backup.log";
system "mkdir -p $target_dir";
$rsync_command = "rsync -ruvt --delete $e_option";
$rsync_command .= " --exclude='Music/**'";
$rsync_command .= " --exclude='Podcasts/**'";
$rsync_command .= " --exclude='.Trash/**'";
$rsync_command .= " --exclude='.local/share/Trash/**'";
$rsync_command .= " --exclude='.beagle/**'";
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
$rsync_command .= " --exclude='.Koala/**'";
$rsync_command .= " --exclude='Downloads/**'";
$rsync_command .= " --exclude='.cache/**'";
$rsync_command .= " --exclude='.thunderbird/**'";
$rsync_command .= " --exclude='.mozilla/**'";
$rsync_command .= " --exclude='.gnupg/**'";
$rsync_command .= " --exclude='.gnome*/**'";
$rsync_command .= " --exclude='.gconf*/**'";
$rsync_command .= " --exclude='.google/desktop/repo/**'";
$rsync_command .= " --exclude='.VirtualBox/HardDisks/**'";
$rsync_command .= " --exclude='Dropbox/**'";
$rsync_command .= " --exclude='.dropbox_dist/**'";
$rsync_command .= " --exclude='.recoll/**'";
$rsync_command .= " --exclude='VirtualBox*/**'";
$rsync_command .= " --exclude='.local/share/gnome-boxes/images/**'";
$rsync_command .= " --exclude='iso/**'";
$rsync_command .= " --exclude='google_drive/**'";
$rsync_command .= " --exclude='Dropbox/**'";
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
