#! /bin/sh
ls -lurt `find /w/cache101/ -type f` `find /w/cache201/ -type f` \
    | perl -e 'while (<>) { \
	s/-rw-r--r--\s+1 root\s+bin\s+/ /; \
	s/-rw-r--r--\s+1 root\s+other\s+/ /; \
	print;}' \
    | nl
