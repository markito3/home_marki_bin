#! /usr/bin/env perl
%month = (Jan => '01', Feb => '02', Mar => '03',
	  Apr => '04', May => '05', Jun => '06',
	  Jul => '07', Aug => '08', Sep => '09',
	  Oct => '10', Nov => '11', Dec => '12');
$date = `date`;
@field = split(/\s+/, $date);
if ($field[2] < 10) {
    $day = '0' . $field[2];
} else {
    $day = $field[2];
}
$date_fixed = $field[5] . "_" . $month{$field[1]} . "_" . $day;
print "$date_fixed\n";
exit 0;
