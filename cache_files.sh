#! /bin/sh
ls -lurt `find /w/cache101/ -type f` `find /w/cache201/ -type f` \
    | perl -e 'while (<>) { \
	s/-rw-r.-r--\s+1\s+root\s+/ /; \
	s/bin|other/ /; \
	s/\s+/ /; \
	print;}' \
    | nl
