#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
# Install google test library

#check if the dependency is already installed
if [ 0 -eq 1 ]; then
  # googletest installed
  echo "ExampleDependency already installed"
else
    # googletest installed
    echo "Installing ExampleDependency"
fi

