#!/bin/bash
pushd $1
mkdir -pv gluex_install_scratch
pushd gluex_install_scratch
day=`date +%j`
logfile=gluex_install_${day}.log
rm -rf $day
mkdir -pv $day
pushd $day
echo installing in `pwd`
echo log file is $logfile
/home/marki/gluex_install/gluex_install.sh >& $logfile
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
    | grep -v "Info Error"
