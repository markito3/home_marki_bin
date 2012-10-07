#!/usr/bin/perl
################################################################################
# Author: Angus Chisholm
# Date: 19/06/2009
# Description: Converts a Revelation Password Manager file to a format readable
#              by Google Secrets import function.
#              This script was tested against version 0.4.11 of Revelation and 
#              version 1.4.1 of Google Secrets.
#              When exporting secrets from Revelation the type must be XML.
#              Please note that as Google Secrets doesn't currently support folders
#              this information will be lost.
################################################################################
use strict;

##########
#Make simple check for input parameter.
##########
if(@ARGV!= 1)
{
  print "Usage: revelation2GS.pl inputFile\n";
  print "  inputFile - File exported from Revelation Password Manager in XML format.\n";  
  exit;
}

my $FALSE = 0;
my $TRUE  = 1;
my $entryCount = 0;

my $fileToConvert = $ARGV[0];
my $result = 'secrets.csv';
my $log = 'secrets.log';

open(LOG, "> $log") or warn "Can't write log file.  Probably won't be able to write results file either: $!\n";
##########
#Read in password file.
##########
print LOG "Converting file $fileToConvert\n\n";
open( IN, "< $fileToConvert" )
  or die "ERROR: Unable to open file $fileToConvert for read: $!\nFor usage run program without any arguments.\n";
my @file = <IN>;
close(IN);
chomp(@file);

##########
#Write headings to file
##########
open(OUT, "> $result") or die "ERROR: Unable to open file $result for write: $!\n";
print OUT '"Description","Id","PIN","Email","Notes"'."\n";

##########
#Parse file and write results.
##########
my ($description, $username, $password, $email, $notes) = ('') x 5; #Initialise all values.
my $type = '';

my $currentlyProcessing = $FALSE;
foreach my $line (@file)
{
  #Revelation export translates & into &amp; to be xml safe.  Translate back...
  $line =~ s/&amp;/&/g;
  
  if ($currentlyProcessing)
  {
    #If this is the end of the description write then results to file else get values...
    if ($line =~ /<\/entry>/)
    {
      print OUT "\"$description\",\"$username\",\"$password\",\"$email\",\"$notes\"\n";     
      ($description, $username, $password, $email, $notes) = ('') x 5; #Reset all values.  Some may not be used by the next entry.
      $currentlyProcessing = $FALSE;
    }
    #Name -> Description
    elsif ( $line =~ /<name>(.*)<\/name>/ )
      { $description = "$1 [$type]" }
    #Description -> Notes.
    elsif ( $line =~ /<description>(.*)<\/description>/ )
      { $notes = $1 }
    #generic-password, generic-pin or generic-code -> PIN
    elsif ( $line =~ /<field id="generic-(password|pin|code)">(.*)<\/field>/ )
      { $password = $2 }
    #generic-username -> ID
    elsif ( $line =~ /<field id="generic-username">(.*)<\/field>/ )
      { $username = $1 }
    #generic-email -> email
    elsif ( $line =~ /<field id="generic-email">(.*)<\/field>/ )
      { $email = $1 }
    #phone-phonenumber -> notes
    elsif ( $line =~ /<field id="phone-phonenumber">(.*)<\/field>/ )
      { $username = $1 }
    #All other generic fields which will be added to notes.
    elsif ( $line =~ /<field id="(generic|creditcard)-(.*)">(.*)<\/field>/ )
      { $notes .= "\n$2: $3" } 
    else
    { print LOG "Unhandled field id: $1\n" if $line =~ /<field id="(.*)">.*<\/field>/ }
  }
  else
  {
    if ($line =~/entry type="(.*)"/)
    {
      $type = $1;
      #Ignore folder structure.
      if ($type ne 'folder')
      {
        print LOG "  Processing $type entry...\n";
        $entryCount++;
        $currentlyProcessing = $TRUE;
      }
    }
  }
}
close(OUT);
print LOG "\nSuccessfully processed $entryCount entries.\n";
print LOG "File saved as $result.  Please remember to remove both this file and $fileToConvert after import.\n";
close(LOG);
print "File saved as $result.  Please remember to remove both this file and $fileToConvert after import.\n";