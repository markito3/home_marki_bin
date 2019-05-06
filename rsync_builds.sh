#!/bin/bash
SOFT=/group/halld/Software
rsync -ruvtl --delete $SOFT/builds/Linux_RHEL6-x86_64-gcc4.9.2/ /u/scratch/marki/builds/Linux_RHEL6-x86_64-gcc4.9.2/
rsync -ruvtl --delete $SOFT/builds/Linux_RHEL7-x86_64-gcc4.8.5/ /u/scratch/marki/builds/Linux_RHEL7-x86_64-gcc4.8.5/
rsync -ruvtl --delete $SOFT/builds/Linux_CentOS6-x86_64-gcc4.9.2/ /u/scratch/marki/builds/Linux_CentOS6-x86_64-gcc4.9.2/
rsync -ruvtl --delete $SOFT/builds/Linux_CentOS7-x86_64-gcc4.8.5/ /u/scratch/marki/builds/Linux_CentOS7-x86_64-gcc4.8.5/
rsync -ruvtl --delete $SOFT/builds/Linux_CentOS7-x86_64-gcc4.8.5-cntr/ /u/scratch/marki/builds/Linux_CentOS7-x86_64-gcc4.8.5-cntr/
