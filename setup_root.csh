if (! $?ROOTSYS) setenv ROOTSYS /usr/local/gluex/root/prod
echo $PATH | grep $ROOTSYS/bin > /dev/null
if ($status) setenv PATH $ROOTSYS/bin:$PATH
echo $LD_LIBRARY_PATH | grep $ROOTSYS/lib > /dev/null
if ($status) setenv LD_LIBRARY_PATH  $ROOTSYS/lib:$LD_LIBRARY_PATH
