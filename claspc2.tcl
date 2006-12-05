#!/usr/bin/expect --
set passwd_cue "********"
set passwd_pc2 "********"
set timeout 30
spawn slogin login.jlab.org
expect "password"
send "$passwd_cue\r"
expect "bash"
send "ssh claspc2\r"
expect "password"
send "$passwd_pc2\r"
expect ">"
interact
