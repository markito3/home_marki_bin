#!/usr/local/bin/perl
$workdisk[0] = "/w/work501";
$workdisk[1] = "/w/work601";
$iwd = 0;
$total_used = 0;
while ($workdisk[$iwd]) {
    open(DF, "df $workdisk[$iwd] |");
    $header = <DF>;
    $info = <DF>;
    chop $info;
    @field = split(/\s+/, $info);
    $used[$iwd] = $field[2];
    $total_used += $used[$iwd];
    $iwd++;
    close(DF);
}
print time(), " $used[0] $used[1] $total_used\n";
exit 0; 
