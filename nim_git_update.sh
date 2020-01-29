#!/bin/bash
rm -fv /home/marki/Downloads/GlueX_nim*.zip
firefox https://www.overleaf.com/project/5d602e3cda81be1208b3787a/download/zip
cd /home/marki/gluex-nim
git checkout master
#git branch -d overleaf
git status
git branch -vv
prompt="Is this OK? "
while true; do
    read -p "$prompt" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
git checkout -b overleaf
find . -path ./.git -prune -o \( -type f -exec rm {} \; \)
unzip /home/marki/Downloads/GlueX_nim.zip
git status
git add --all .
now=`date`
git commit -m "overleaf as of $now"
