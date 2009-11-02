#!/bin/sh
rm -f ignore.tmp
svn propget svn:ignore . > ignore.tmp
emacs ignore.tmp
svn propset svn:ignore -F ignore.tmp .
