#!/usr/bin/expect --
#
# get the password
#
stty -echo
send_user "password? "
expect_user -re "(.*)\n"
send_user "\n"
set password $expect_out(1,string)
#
# login
#
spawn telnet cebaf2.cebaf.gov
expect "Username:"
send "marki\r"
expect "Password:"
send "$password\r"
#
# start the calendar
#
expect "CEBAF2"
send "dir\r"
expect "CEBAF2"
send "calendar\r"
interact
