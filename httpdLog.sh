#! /bin/sh
grep -v robots.txt /var/log/httpd/access_log | grep -v 129.57.33.191 \
    | grep -v .gif | grep -v /node | grep -v .css | grep -v 216.35.119.76 \
    | grep -v .jpg
