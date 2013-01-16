#!/bin/csh
set logfile=/scratch/marki/logbot.log
set logbotdir=/home/marki/logbot
cd $logbotdir
setenv CLASSPATH .:$logbotdir/lib/pircbot.jar
rm -f $logfile
java org/jibble/logbot/LogBotMain > & $logfile &
exit
