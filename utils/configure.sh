#!/bin/bash
# This file installs all the dependencies for the project.

# Variable that contains the path of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

bash $SCRIPT_DIR/install/install_dependencies.sh

