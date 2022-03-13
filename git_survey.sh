#!/bin/bash
find . -maxdepth 3 -type d -name .git | awk '{print "pushd "$1">/dev/null; cd ..; echo ===========================; pwd; . ~/.bashrc; gitq; popd>/dev/null"}' | bash
