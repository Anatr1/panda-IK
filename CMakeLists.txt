#Modify this file only if you are expert.
#Parameters can be changed in utils/cmake/project-settings.cmake

#set CMake minimum version
cmake_minimum_required(VERSION 3.10)

#include user-defined variables and functions in project settings.
#Notice that include() calls the instructions from the file without needing to re-define the variables.
include(utils/cmake/project-settings.cmake)

#set project name
project(${DIANA_PROJECT_NAME})

#Perform project checks
#Calls the instructions inside "check.cmake" file.
#Notice that include() calls the instructions from the file without needing to re-define the variables.
include(utils/cmake/check.cmake)

set(CMAKE_INSTALL_RPATH ${DIANA_SYSTEM_DIR_LIB})
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

#Print variables
#Calls the instructions inside "print.cmake" file.
#Notice that include() calls the instructions from the file without needing to re-define the variables.
include(utils/cmake/print.cmake)

#Honestly I don't know what this is
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

#Set up project_globalvariables.h, containing global project variables
configure_file(utils/project_cmakevariables.h.in project_cmakevariables.h @ONLY)

#Include the "build" directory in order to add dynamically configured headers
set(MAIN_BUILD_DIR ${CMAKE_CURRENT_BINARY_DIR})

#Add subdirectory modules.
#Calls the instructions inside "add-subdirectory.cmake" file.
#Notice that include() calls the instructions from the file without needing to re-define the variables.
include(utils/cmake/add-subdirectory.cmake)

#Set the diana library path as a linker directory. Linker will look there for DIANA libraries
link_directories(${DIANA_SYSTEM_DIR_LIB})


#Configure the Doxyfile.
configure_file(Doxyfile Doxyfile)

#Configure the file, that can be used to install the Install manifest on the system.
configure_file(utils/export_InstallManifest DIANA_SetupInstallManifest.sh @ONLY)

#Configure the bash file that reads the installed install manifest and uninstalls the installed files
configure_file(utils/uninstallManifest DIANA_uninstall.sh @ONLY)

#If variable for documentation is enabled, add generation and export of documentation on install.
if(${DIANA_INSTALL_DOCUMENTATION_ENABLED})
  #Generate documentation
  install(CODE "execute_process(COMMAND doxygen ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)")
  #Install documentation for this module
  install(DIRECTORY ${DIANA_PROJECT_DOCS}
          DESTINATION ${DIANA_SYSTEM_DIR_DOCS}/${PROJECT_NAME})
endif()



#Hello by Taccone
#Print the end of DIANA-Template messages
message(" ")
message("${BoldCyan}END OF DIANA TEMPLATE CONFIGURATION${ColourReset}")


# DIANA-Template Cpp - 2023
# Crafted with <3 and some >:( by Thomas Galliano
