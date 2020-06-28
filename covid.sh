#!/bin/bash
cd ~/covid-19-data
git pull
cd ~/Desktop/covid
./grep_data.sh
gnuplot covid.gnuplot
