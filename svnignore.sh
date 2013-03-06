#!/bin/sh
TEMPFILE=/tmp/ignore.tmp
rm -f $TEMPFILE
svn propget svn:ignore . > $TEMPFILE
emacs $TEMPFILE
svn propset svn:ignore -F $TEMPFILE .
