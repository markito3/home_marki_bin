#!/usr/bin/env perl
$begin_comment = '\/\*';
print "$begin_comment\n";
$end_comment = '\*\/';
$comment_in_progress = 0;
while (<>) {
    $line = $_;
    if (/$begin_comment/) {
# keep stuff before the comment marker
	#print "begin comment\n";
	split /$begin_comment/;
	$line = "$_[0]\n";
# turn on comment in progress flag
	$comment_in_progress = 1;
    }
    if (/$end_comment/) {
	#print "end comment\n";
	split /$end_comment/;
	$line = $_[1];
	$comment_in_progress = 0;
    }
    if (!$comment_in_progress) {
	if ($line =~ /\S/) {
	    print $line;
	}
    }
}
exit;
