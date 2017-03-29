#!/usr/bin/env perl
$dir = $ARGV[0];
$tar_size_limit = $ARGV[1];
$filelist = "/tmp/${dir}_filelist.txt";
open(FIND,"find $dir -type f -name \*.root | sort |");
$total_size = 0;
$file_count = 0;
$tar_size = 0;
$ntar = 0;
open(FILELIST,"> $filelist");
$tar_dir = "${dir}_tarfiles";
system "mkdir -pv $tar_dir";
while ($filename = <FIND>) {
    chomp $filename;
    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
     $atime,$mtime,$ctime,$blksize,$blocks)
	= stat($filename);
    $file_count++;
    $tar_size += $size;
    $total_size += $size;
    #print "$filename $size $tar_size $file_count $total_size\n";
    print FILELIST "$filename\n";
    if ($tar_size > $tar_size_limit) {ship_it();}
}
if ($tar_size > 0) {ship_it();}
close(FILELIST);
print "$file_count $total_size\n";
exit;

sub ship_it {
    close(FILELIST);
    $ntar++;
    print "ship it, $ntar\n";
    $ntar_padded = sprintf("%0.4d", $ntar);
    system "tar cf $tar_dir/${dir}_${ntar_padded}.tar -T$filelist\n";
    $tar_size = 0;
    open(FILELIST,"> /tmp/filelist.txt");
    return;
}
