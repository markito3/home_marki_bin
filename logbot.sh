#!/bin/sh
logfile=/scratch/marki/logbot.log
logbotdir=/home/marki/logbot
cd $logbotdir
setenv CLASSPATH .:$logbotdir/pircbot.jar
rm -f $logfile
java org/jibble/logbot/LogBotMain > & $logfile &
exit
