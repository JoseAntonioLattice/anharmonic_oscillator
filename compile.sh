#! /bin/bash

FC=gfortran
SRC=./src
BIN=./bin
DATA=./data
TARGET=anharmonic_oscillator.exe
FFLAGS="-Wall -Wextra -fcheck=all -std=f2008 -O0"

if [ -d $BIN ]
then
    rm $BIN/*
else
    mkdir $BIN
fi

if [ -d $DATA ]
then
    echo $DATA "directory exist"
else
    mkdir $DATA
fi

$FC $FFLAGS -J$BIN -c $SRC/parameters.f90 -o $BIN/parameters.o
$FC $FFLAGS -J$BIN -c $SRC/arrays.f90 -o $BIN/arrays.o
$FC $FFLAGS -J$BIN -c $SRC/starts.f90 -o $BIN/starts.o
$FC $FFLAGS -J$BIN -c $SRC/periodic_boundary_conditions.f90 -o $BIN/periodic_boundary_conditions.o
$FC $FFLAGS -J$BIN -c $SRC/euclidean_lagrangian.f90 -o $BIN/euclidean_lagrangian.o
$FC $FFLAGS -J$BIN -c $SRC/local_update_algorithms.f90 -o $BIN/local_update_algorithms.o
$FC $FFLAGS -J$BIN -c $SRC/dynamics.f90 -o $BIN/dynamics.o
$FC $FFLAGS -J$BIN -c $SRC/main.f90 -o $BIN/main.o
$FC $BIN/*.o -o $BIN/$TARGET
$BIN/$TARGET <<< parameters.dat
