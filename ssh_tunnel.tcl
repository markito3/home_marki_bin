#!/usr/bin/expect --
set passwd "********"
set timeout 30
spawn ssh -t -L5901:localhost:5901 login2.jlab.org \
    ssh -t -L5901:localhost:5901 claspc2
expect "password"
send "$passwd\r"
expect "password"
send "$passwd\r"
expect ">"
#send "vncserver -kill :1\r"
#expect ">"
#send "vncserver\r"
interact
