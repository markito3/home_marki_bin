#! /bin/sh
file=$1
echo "select volume from file where mss_path_name=\"$file\"" \
    | mysql -h mss2 -u farmuser TapeServer
exit
# end of shell script
