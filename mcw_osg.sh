#!/bin/bash
pushd /osgpool/halld/marki
source $SOFT/build_scripts/gluex_env_jlab.sh
gluex_MC.py MCrho.config 30966 1000 batch=1
condor_q
