#! /bin/tcsh -f
ssh clon00 /home/marki/bin/online_mirror_tar.csh
cd /home/marki/public_html
tar xf /work/clas/disk2/marki/html.tar
rm -rf online_html
mv html online_html
exit
