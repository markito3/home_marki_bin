#!/usr/bin/expect --
set passwd "********"
set passwd2 "********"
set timeout 30
spawn ssh -t -L5901:localhost:5901 login.jlab.org \
    ssh -t -L5901:localhost:5901 roentgen
expect "password"
send "$passwd\r"
#expect "password"
#send "$passwd2\r"
expect ">"
interact
