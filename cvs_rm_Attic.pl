#!/usr/local/bin/perl
$filename = $ARGV[0];
if (-f $filename) {
    print "file exists; do nothing\n";
    exit 1;
}
system("cvs log $filename");
print "cvs rm and ci the file? (y/n): ";
$answer = <STDIN>;
chop $answer;
if ($answer eq 'y') {
    print "doing a cvs rm on $filename\n";
    system("cvs up -A $filename");
    system("rm $filename");
    system("cvs rm $filename");
    system("cvs ci -m 'adding a dead version' $filename");
} else {
    print "answer not y; do nothing\n";
}
exit 0;
