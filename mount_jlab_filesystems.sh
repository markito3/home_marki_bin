#!/bin/bash
sshfs -p9001 localhost:/w/halld-scifs17exp /mnt/work/halld
sshfs -p9001 localhost:/v/lustre19/expphy/cache/halld /mnt/cache/halld
