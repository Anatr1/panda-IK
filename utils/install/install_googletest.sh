#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
# Install google test library

#check if googletest is installed in this repository
if [[ $(ls $SCRIPT_DIR/../../tests | grep googletest) ]]; then
  # googletest installed
  echo "googletest library already installed"
else
  # googletest not installed
  cd $SCRIPT_DIR/../../tests &&\
  git clone --depth 1 --branch release-1.12.1 https://github.com/google/googletest.git
  #cd googletest
  #mkdir build
  #cd build
  #cmake -DBUILD_SHARED_LIBS=ON  ..
  #make
  #sudo make install
  #cd ../utils
fi

# DIANA-Template Cpp - 2023
# Crafted with <3 by Thomas Galliano
