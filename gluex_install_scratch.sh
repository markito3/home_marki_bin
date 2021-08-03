#!/bin/bash

. /home/marki/bin/get_latest_release.sh

date
scratch_install_dir=$1
version_set_file=$2
if ! pushd $1
then
    echo gluex_install_scratch.sh error: could not pushd to $1, exiting
    exit 1
fi
mkdir -pv gluex_install_scratch
pushd gluex_install_scratch
day=`date +%F`
logfile=gluex_install_${day}.log
rm -rf $day
mkdir -pv $day
pushd $day
echo gluex_install_scratch.sh info: installing in `pwd`
echo gluex_install_scratch.sh info: log file is $logfile
git clone -q https://github.com/jeffersonlab/gluex_install
pushd gluex_install
git checkout -q `get_latest_release jeffersonlab/gluex_install`
popd
#export NTHREADS=8
options=""
if [ -n "$version_set_file" ]
then
    echo gluex_install_scratch.sh info: default version set specified, using $version_set_file
    options="-s $version_set_file"
else
    echo gluex_install_scratch.sh info: default version set not specified, will use default default version set
fi
gluex_install/gluex_install.sh $options >& $logfile
grep -i error $logfile \
    | grep -v DOMErrorImpl \
    | grep -v XSDErrorReporter \
    | grep -v DOMPrintErrorHandler \
    | grep -v DOMTreeErrorReporter \
    | grep -iv g4error \
    | grep -v DANARootErrorHandler \
    | grep -v jerror \
    | grep -v AsymmetricError \
    | grep -v CCDBError \
    | grep -iv strerror \
    | grep -v errorpropagation \
    | grep -v out_error \
    | grep -v G4VErrorLimitProcess \
    | grep -v G4MagErrorStepper \
    | grep -v G4ConversionFatalError \
    | grep -v TError \
    | grep -v Error.h \
    | grep -v TGraph2DErrors \
    | grep -v TGraphAsymmErrors \
    | grep -v TGraphBentErrors \
    | grep -v TGraphErrors \
    | grep -v NetErrors \
    | grep -v ExpectedErrorPruneTool \
    | grep -v MisClassificationError \
    | grep -v RooErrorHandler \
    | grep -v RooErrorVar \
    | grep -v RooHistError \
    | grep -v ErrorHandler \
    | grep -v IERROR \
    | grep -v error.cxx \
    | grep -v rf610_visualerror.C \
    | grep -v rf606_nllerrorhandling.C \
    | grep -v rf307_fullpereventerrors.C \
    | grep -v rf306_condpereventerrors.C \
    | grep -v gerrors.py \
    | grep -v graph2derrorsfit.C \
    | grep -v gerrors2.C \
    | grep -v gerrors.C \
    | grep -v ErrorIntegral.C \
    | grep -v XMLErrorC \
    | grep -v Error.cpp.o \
    | grep -v ErrorHandling.cpp.o \
    | grep -v regerror.c.o \
    | grep -v Error.cpp.o \
    | grep -v Error.cpp.o \
    | grep -v CodeViewError.cpp.o \
    | grep -v OrcError.cpp.o \
    | grep -v "Info Error" \
    | grep -v EvtValError \
    | grep -v "numerical error" \
    | grep -v "grep Error" \
	   
date
