#! /bin/sh
ssh -n clasweb tail -1000 /var/log/httpd/access.log \
    | grep -v clasun | grep -v ccl3 | grep -v claspc2 | grep -v googlebot \
    | grep -v /elton | grep -v .gif | grep -v clastest.servlet \
    | grep -v marvin.northernlight.com
# end of Bourne shell script
