#! /bin/sh
volume=$1
echo "select mss_path_name from file where volume=$volume" \
    | mysql -h mss2 -u farmuser TapeServer
exit
# end of shell script
