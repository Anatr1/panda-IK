#!/bin/bash

# Install Moquette library
#Install eventual dependencies
sudo apt install mosquitto mosquitto-dev libmosquitto-dev -y

#check if Moquette already installed
if [[ $(ls /usr/include | grep MqttManager.hpp) ]]; then
  # Moquette installed
  echo "Moquette library already installed"
else
    if [ -z "$GITHUB_ACTION_USERNAME" ]; then
      git clone git@github.com:team-diana/Moquette.git
    else
      git clone https://$GITHUB_ACTION_USERNAME:$GITHUB_ACTION_PASSWORD_PAT@github.com/team-diana/Moquette.git
    fi

  cd Moquette
  make configure
  make compile
  make install
  cd ..
  sudo rm -rf Moquette
fi

# DIANA-Template Cpp - 2023
# Crafted with <3 by Thomas Galliano
