#!/usr/bin/env perl
$username = $ARGV[0];
open (FINGER, "finger $username |");
while (<FINGER>) {print;}
print "Add this user? ";
$answer = <STDIN>;
chomp $answer;
if ($answer ne 'y') {die "not adding user $username"}
open (MAIL,
      "| mail -s \"add user $username to clas group\" helpdesk\@jlab.org");
print MAIL "Please add user $username to the clas unix group. clas should\n";
print MAIL "be this user's default group.\n\n";
print MAIL "Thanks.\n";
close (MAIL);
exit;
