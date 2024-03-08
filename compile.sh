#! /bin/bash

SRC=./src
BIN=./bin
FFLAGS="-Wall -Wextra -fcheck=all -std=f2008 -O0"

if [ -d $BIN ]
then
    rm $BIN/*.exe
else
    mkdir $BIN
fi

gfortran $FFLAGS -J$BIN -c $SRC/parameters.f90 -o $BIN/parameters.o
gfortran $FFLAGS -J$BIN -c $SRC/arrays.f90 -o $BIN/arrays.o
gfortran $FFLAGS -J$BIN -c $SRC/main_test.f90 -o $BIN/main_test.o
gfortran $BIN/*.o -o $BIN/anharmonic_oscillator.exe
$BIN/anharmonic_oscillator.exe <<< parameters.dat
