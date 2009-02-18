#!/usr/bin/perl -w
$dir_mother = $ARGV[0];
$last_dir = `ls $dir_mother | tail -1`;
chomp $last_dir;
if ($last_dir eq '') {
    $new_dir_number = 0;
} else {
    $new_dir_number = $last_dir + 1;
}
$new_dir_name = sprintf("%05d", $new_dir_number);
system "mkdir $dir_mother/$new_dir_name";
print "$dir_mother/$new_dir_name\n";
exit;
