#!/usr/local/bin/perl
while (<>) {
    chop;
    $name = $_;
    system('work_warn_mail.csh', $name);
}
exit;
