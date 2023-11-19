#!/bin/bash
# This file installs all the dependencies for the project.

# Variable that contains the path of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

bash $SCRIPT_DIR/install/install_dependencies.sh

#bash $SCRIPT_DIR/install/install_toml.sh

#bash $SCRIPT_DIR/install/install_googletest.sh

#bash $SCRIPT_DIR/install/install_Moquette.sh

#bash $SCRIPT_DIR/install/install_shmem.sh

#bash $SCRIPT_DIR/install/install_Moquette2.sh

#Add a line with other dependencies installations files
#bash install/install_exampleDependency.sh
