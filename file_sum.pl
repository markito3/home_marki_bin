#!/usr/local/bin/perl
$total_size = 0;
while ($file = <STDIN>) {
    #print $file;
    chop $file;
    open(LS, "ls -ld $file |");
    $line = <LS>;
    @field = split(/\s+/, $line);
    $size = $field[4];
    $total_size += $size;
    #print "size=$size total_size=$total_size\n";
}
print "$total_size\n";
exit 0;
