#! /bin/sh
ssh clasweb cat /var/log/httpd/access.log | tail -1000 \
    | grep -v robots.txt | grep -v 129.57.33.191 \
    | grep -v .gif | grep -v /node | grep -v .css | grep -v 216.35.119.76 \
    | grep -v .jpg | grep -v 129.57.35.95 | grep -v /Jdh/ | grep -v /elton/ \
    | grep -v 64.208.37. | grep -v 216.35.103. | grep -v 199.172.149.
# end of Bourne shell script
