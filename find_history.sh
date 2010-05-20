#!/bin/sh
find /snapshot -maxdepth 4 -name .history -exec ls -l {} \; | sort -k6 -k7
