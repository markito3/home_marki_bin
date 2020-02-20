#!/bin/bash
rm -fv /home/marki/Downloads/Pi0%20Polarizability%20Proposal.zip*
firefox https://www.overleaf.com/project/5d5d22c3f2f2fe72b728c4e6/download/zip
cd /home/marki/pi0_polarizability_proposal
git checkout overleaf
git status
git branch -vv
prompt="Is OK to load the zip file? "
while true; do
    read -p "$prompt" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
find . -path ./.git -prune -o \( -type f -exec rm {} \; \)
unzip /home/marki/Downloads/Pi0%20Polarizability%20Proposal.zip
git status
prompt="Is OK to commit the changes? "
while true; do
    read -p "$prompt" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
git add --all .
now=`date`
git commit -m "overleaf as of $now"
