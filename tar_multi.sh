#! /bin/sh
echo Preparing volume $TAR_VOLUME of $TAR_ARCHIVE.

name=`expr $TAR_ARCHIVE : '\(.*\)-.*'`
case $TAR_SUBCOMMAND in
-c)       ;;
-d|-x|-t) test -r ${name:-$TAR_ARCHIVE}-$TAR_VOLUME || exit 1
	  ;;
*)        exit 1
esac

echo ${name:-$TAR_ARCHIVE}-$TAR_VOLUME >&3

