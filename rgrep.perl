#!/usr/local/bin/perl
#if ($ARGV[0] || die);
open(DIR,"ls -R |");
while (<DIR>) {
  chop;
  $file = $_;
  if ($file ne "") {
    if ($file =~ /^\./) {
      $dir = $file;
      chop($dir);
    }
    else {
      if ($file =~ /$ARGV[1]/ && -T "$dir/$file") {
        #print "opening file $dir/$file\n";
        open(FILE,"$dir/$file");
        while (<FILE>) {
          if (/$ARGV[0]/) {
            print "$dir/$file: $_";
          }
        }
      }
    }
  }
}
