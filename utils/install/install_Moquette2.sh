#!/bin/bash

# Install Moquette2 library

#check if Moquette2 already installed
if [[ $(ls /usr/local/diana/lib | grep libMoquette2) ]]; then
  # Moquette installed
  echo "Moquette2 library already installed"
else
    if [ -z "$GITHUB_ACTION_USERNAME" ]; then
      git clone git@github.com:team-diana/Moquette2.git
    else
      git clone https://$GITHUB_ACTION_USERNAME:$GITHUB_ACTION_PASSWORD_PAT@github.com/team-diana/Moquette2.git
    fi

  cd Moquette2
  make configure
  make build
  make install
  cd ..
  sudo rm -rf Moquette2
fi

# DIANA-Template Cpp - 2023
# Crafted with <3 by Thomas Galliano
