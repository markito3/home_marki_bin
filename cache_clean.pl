#!/usr/local/bin/perl
open (FINDFILE, "find /w/cache101/ /w/cache201/ -type f |");
$npaths = 0;
while ($file = <FINDFILE>) {
    #print "$file";
    chop $file;
    $path_temp = $file;
    $path_temp =~ s/\/w\/cache101//;
    $path_temp =~ s/\/w\/cache201//;
    @dirnames = split(/\//, $path_temp);
    #print "#dirnames=$#dirnames\n";
    $path = '';
    for ($i = 1; $i < $#dirnames; $i++) {
	$dir = $dirnames[$i];
	#print "dir=$dir\n";
	$path .= '/' . $dir;
    }
    #print "path=$path\n";
    $found = 0;
	for ($ip = 0; $ip < $npaths; $ip++) {
	    if ($path eq $pathfound[$ip]) {$found = 1;}
    }
    if (!$found) {
	if ($path !~ /ha|c_temp/) {
	    print "found new path: $path\n";
	    @pathfound[$npaths++] = $path;
	}
    }
}
print "npaths=$npaths\n";
for $path (@pathfound) {
    $size = `find /w/cache101$path /w/cache201$path -atime -30 | file_sum.pl`;
    $size = $size/1.e9;
    print "path=$path size=$size\n";
}
exit 0;
