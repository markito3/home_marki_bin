#!/usr/local/bin/perl
$workdisk[0] = "/w/work501";
$workdisk[1] = "/w/work601";
$icd = 0;
$access_time_max[0] = 0;
$access_time_max[1] = 0;
while ($workdisk[$icd]) {
    open(FIND, "find $workdisk[$icd] -size +1000k -type f |");
    while ($file = <FIND>) {
	chop $file;
	$access_time = -A $file;
	if ($access_time > $access_time_max[$icd]) {
	    $access_time_max[$icd] = $access_time;
	}
        #print "$file $access_time $access_time_max[$icd]\n";
    }
    $icd++;
}
print time()," $access_time_max[0] $access_time_max[1]\n";
exit 0;
