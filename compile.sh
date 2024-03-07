#! /bin/bash

SRC=./src
BIN=./bin
OBJ=./obj
#FLAGS="-Wall -Wextra -std=f2008 -fcheck=all -fbacktrace -o0"

#$FLAGS

if [ -d $BIN ]
then
    rm $BIN/*.exe
else
    mkdir $BIN
fi

if [ -d $OBJ ]
then
    rm $OBJ/*.o
else
    mkdir $OBJ
fi

gfortran -J$OBJ -c $SRC/parameters.f90 -o $OBJ/parameters.o
gfortran -J$OBJ -c $SRC/arrays.f90 -o $OBJ/arrays.o
gfortran -J$OBJ -c $SRC/main_test.f90 -o $OBJ/main_test.o
gfortran $OBJ/*.o -o $BIN/anharmonic_oscillator.exe
$BIN/anharmonic_oscillator.exe <<< parameters.dat
