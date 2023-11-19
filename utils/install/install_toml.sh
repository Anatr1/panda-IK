#!/bin/bash

# Install toml11 library

#check if toml already installed
if [[ $(ls /usr/local/include | grep toml) ]]; then
  # Toml installed
  echo "toml11 library already installed"
else
  # Toml not installed
  git clone https://github.com/ToruNiina/toml11.git
  cd toml11
  mkdir build
  cd build
  cmake -Dtoml11_BUILD_TEST=OFF -DCMAKE_CXX_STANDARD=C++17 ..
  make
  sudo make install
  cd ../..
  sudo rm -f -r toml11
fi

# DIANA-Template Cpp - 2023
# Crafted with <3 by Thomas Galliano
