#!/bin/bash
sshfs -p9001 localhost:/w/halld-scshelf2101 /mnt/work/halld
sshfs -p9001 localhost:/v/lustre19/expphy/cache/halld /mnt/cache/halld
sshfs -p9001 localhost:/v/lustre19/expphy/volatile/halld /mnt/volatile/halld
sshfs -p9001 localhost:/w/mss/halld /mnt/mss/halld
sshfs -p9001 localhost:/u/scratch/marki /mnt/scratch/marki
sshfs -p9001 localhost:/u/scratch/gluex /mnt/scratch/gluex
sshfs -p9001 localhost:/u/group/halld /mnt/group/halld
