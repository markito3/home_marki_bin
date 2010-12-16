#!/usr/bin/perl
select STDERR;
$| = 1;
$nsec = $ARGV[0];
for ($i = 0; $i < $nsec; $i++) {
    sleep 1;
    print ".";
}
exit;
