#!/usr/local/bin/perl
open(TS, "/site/bin/jtsstat |");
$nreqs = 0;
$reqno_min = 9999999;
$reqno_max = 0;
while ($info = <TS>) {
    chop $info;
    @field = split(/\s+/, $info);
    $reqno = $field[0];
    $nreqs++;
    if ($reqno < $reqno_min) {$reqno_min = $reqno;}
    if ($reqno > $reqno_max) {$reqno_max = $reqno;}
}
print time(), " $nreqs $reqno_min $reqno_max\n";
exit 0;
