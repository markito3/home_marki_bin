#!/usr/bin/expect --
set ioc $argv
set passwd "********"
set timeout 30
spawn slogin login.jlab.org
expect "password"
send "$passwd\r"
expect "bash"
send "ssh $ioc\r"
expect "password"
send "$passwd\r"
expect ">"
interact
