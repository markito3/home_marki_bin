#!/bin/bash
rm -fv /home/marki/Downloads/GlueX_nim*.zip
firefox https://www.overleaf.com/project/5d5fe70448badb5a9fff112e/download/zip
cd /home/marki/git/tof-nim
git checkout master
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
unzip /home/marki/Downloads/GlueX_TOF.zip
git status
git add --all .
now=`date`
git commit -m "overleaf as of $now"
