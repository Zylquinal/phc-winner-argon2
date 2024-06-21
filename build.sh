#!/bin/bash

cd "$(dirname "$0")"

rm -rf dist
mkdir -p dist

# Build the project

# x86_64-linux-gnu-gcc
KERNEL_NAME=Linux CC=x86_64-linux-gnu-gcc CCX=x86_64-linux-gnu-g++ OUTDIR=x86_64-linux OPTTEST=1 make
mv x86_64-linux dist
make clean

# aarch64-linux-gnu-gcc-14
KERNEL_NAME=Linux CC=aarch64-linux-gnu-gcc-14 CCX=aarch64-linux-gnu-g++-14 OUTDIR=aarch64-linux OPTTEST=1 make
mv aarch64-linux dist
make clean

#x86_64-w64-mingw32-gcc
KERNEL_NAME=MINGW CC=x86_64-w64-mingw32-gcc CCX=x86_64-w64-mingw32-gcc OUTDIR=x86_64-windows OPTTEST=1 make
mv x86_64-windows dist
make clean

#aarch64-w64-mingw32-clang
KERNEL_NAME=MINGW CC=aarch64-w64-mingw32-clang CCX=aarch64-w64-mingw32-clang++ OUTDIR=aarch64-windows OPTTEST=1 make
mv aarch64-windows dist
make clean

#aarch64-apple-darwin-clang
KERNEL_NAME=Darwin CC=oa64-clang CCX=oa64-clang++ OUTDIR=aarch64-apple OPTTEST=1 make
mv aarch64-apple dist
make clean

#x86_64-apple-darwin-clang
KERNEL_NAME=Darwin CC=o64-clang CCX=o64-clang++ OUTDIR=x86_64-apple OPTTEST=1 make
mv x86_64-apple dist
make clean