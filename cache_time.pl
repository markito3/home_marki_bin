#!/usr/local/bin/perl
$cachedisk[0] = "/w/cache301";
$cachedisk[1] = "/w/cache402";
$cachedisk[2] = "/w/cache501";
$cachedisk[3] = "/w/cache601";
$access_time_delete = 36;
$icd = 0;
$access_time_max = 0;
while ($cachedisk[$icd]) {
    open(FIND, "find $cachedisk[$icd] -type f |");
    while ($file = <FIND>) {
	chop $file;
	$access_time = -A $file;
	if ($access_time < $access_time_delete
	    && $access_time > $access_time_max) {
	    $access_time_max = $access_time;
	}
        #print "$file $access_time $access_time_max\n";
    }
    $icd++;
}
print time()," $access_time_max\n";
exit 0;
