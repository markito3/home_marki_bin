#!/usr/local/bin/perl
$cachedisk[0] = "/w/cache501";
$cachedisk[1] = "/w/cache601";
$icd = 0;
$access_time_max = 0;
while ($cachedisk[$icd]) {
    open(FIND, "find $cachedisk[$icd] -type f |");
    while ($file = <FIND>) {
	chop $file;
	$access_time = -A $file;
	if ($access_time > $access_time_max) {
	    $access_time_max = $access_time;
	}
        #print "$file $access_time $access_time_max\n";
    }
    $icd++;
}
print time()," $access_time_max\n";
exit 0;
