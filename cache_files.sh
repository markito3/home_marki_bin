#! /bin/sh
ls -lurt `find /w/cache101/ -type f` `find /w/cache201/ -type f` \
    | perl -e 'while (<>) { \
	s/-rw-r--r--   1 root     bin     //; \
	s/-rw-r--r--   1 root     others  //; \
	print;}' \
    | nl
