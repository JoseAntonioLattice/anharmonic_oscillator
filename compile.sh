#! /bin/bash

FC=gfortran
SRC=./src
BIN=./bin
TARGET=anharmonic_oscillator.exe
FFLAGS="-Wall -Wextra -fcheck=all -std=f2008 -O0"

if [ -d $BIN ]
then
    rm $BIN/*.exe
    rm $BIN/*.o
else
    mkdir $BIN
fi

$FC $FFLAGS -J$BIN -c $SRC/parameters.f90 -o $BIN/parameters.o
$FC $FFLAGS -J$BIN -c $SRC/arrays.f90 -o $BIN/arrays.o
$FC $FFLAGS -J$BIN -c $SRC/main.f90 -o $BIN/main.o
$FC $BIN/*.o -o $BIN/$TARGET
$BIN/$TARGET <<< parameters.dat
