#!/usr/local/bin/perl
open (FINDFILE, "find /w/cache101 /w/cache201 -type f |");
$npaths = 0;
while (<FINDFILE>) {
    print;
    chop;
    s/\/w\/cache101\///;
    s/\/w\/cache201\///;
    @dirnames = split(/\//);
    print "#dirnames=$#dirnames\n";
    $path = '';
    for ($i = 0; $i < $#dirnames; $i++) {
	$dir = $dirnames[$i];
	print "dir=$dir\n";
	$path .= '/' . $dir;
    }
    print "path=$path\n";
    $found = 0;
    for ($ip = 0; $ip < $npaths; $ip++) {
	if ($path eq $pathfound[$ip]) {$found = 1;}
    }
    if (!$found) {@pathfound[$npaths++] = $path}
}
print "npaths=$npaths\n";
for $path (@pathfound) {print "$path\n";}
exit 0;
