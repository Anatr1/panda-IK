#!/bin/bash

# Install SHMEM library

#check if SHMEM already installed
if [[ $(ls /usr/local/diana/include | grep Shmem.hpp) ]]; then
  # Moquette installed
  echo "SHMEM library already installed"
else
  if [ -z "$GITHUB_ACTION_USERNAME" ];
  then
    git clone git@github.com:team-diana/SHMEM.git
  else
     git clone https://$GITHUB_ACTION_USERNAME:$GITHUB_ACTION_PASSWORD_PAT@github.com/team-diana/SHMEM.git
  fi

  cd SHMEM
  make build && make install
  cd ..
  sudo rm -rf SHMEM
fi

# DIANA-Template Cpp - 2023
# Crafted with <3 by Thomas Galliano
