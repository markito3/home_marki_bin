#! /usr/bin/env perl
open (DATE, "date -d '1 week ago' '+%Y-%m-%d %H:%M:%S' |");
$time_back = <DATE>;
close (DATE);
chomp $time_back;
print "time_back = $time_back\n";
$tempfile = "/tmp/caldb_show_changes.txt";
system "rm -f $tempfile";
system "echo Changes to the main run index since $time_back. > $tempfile";
system "echo >> $tempfile";
system "/group/clas/tools/caldb/caldb_show_changes.pl t=\'$time_back\'"
    . " skip_run_control=1 quiet=1 >> $tempfile";
open (WC, "wc -l $tempfile |");
$line = <WC>;
chomp $line;
@field = split(/\s+/, $line);
$nlines = $field[1];
print "nlines = $nlines\n";
if ($nlines == 2) {
    system "rm -f $tempfile";
    open (MESSAGE, ">> $tempfile");
    print MESSAGE "No changes since $time_back.\n";
    close (MESSAGE);
}
system "mail -s 'CalDB changes for the week past' marki\@jlab.org < $tempfile";
# end of perl script
