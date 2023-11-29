#Name of project/Library
project(Panda-IK)

#C++ Standard
set(CMAKE_CXX_STANDARD 17)

#Print Name
message("${BoldMagenta}${PROJECT_NAME}${ColourReset}")

#Include (and run) the module-settings.cmake, for utils settings.
include(utils/cmake/module-settings.cmake)

#Adds the path defined in ${DIANA_SYSTEM_DIR_LIB} (contains all the DIANA installed libraries, following conventions) as a path for the linker to look for.
link_directories(${DIANA_SYSTEM_DIR_LIB})
#Adds the path defined in ${DIANA_SYSTEM_DIR_INC} (contains all the DIANA installed headers, following conventions) to be able to found the includes for DIANA libraries
include_directories(${DIANA_SYSTEM_DIR_INC})

#Add All the files for the library
add_library(${PROJECT_NAME} SHARED include/panda_ik.hpp source/panda_ik.cpp)

#Find libraries
#ind_package(toml11 REQUIRED
             #Add here a new line if needed
#             )

#Includes the main build directory (e.g. the build folder, or cmake-build-*), containing the header file "project_globalvariables.h"
#This way you can include and use the declared variables in your C++ file.
include_directories(${MAIN_BUILD_DIR})

#Add here the directories containing header files to be included. This helps include in your code the header files
#(e.g. #include "something.h" instead of #include "../a/path/to/someting.h")
include_directories(include
        ${CMAKE_CURRENT_SOURCE_DIR}/include/Eigen
        #Add here a new line if needed
        )

#Tell the linker to add libraries ("-lNameOfLibrary")
#target_link_libraries(${PROJECT_NAME}
#                      toml11::toml11  #Toml Library for setting files
#                      Moquette        #DIANA Mqtt Shared Library
#                      pthread
#                      rt              #rt, needed by SHMEM
#                      Shmem          #DIANA Shared Memory Library
#                      Moquette2
                      # Add a line here to link more libraries
#                     )


set(RST_PUBLIC_HEADERS
        ${CMAKE_CURRENT_SOURCE_DIR}/include/panda_ik.hpp
        ${CMAKE_CURRENT_SOURCE_DIR}/include/franka_ik_He.hpp
        )

#Insert Headers that will go public here
set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER
                "${RST_PUBLIC_HEADERS}"
                )

#On Installation, export the files in the utils folders
INSTALL(TARGETS ${PROJECT_NAME}
        LIBRARY DESTINATION ${DIANA_SYSTEM_DIR_LIB} #Destination for the library files (.so)
        PUBLIC_HEADER DESTINATION ${DIANA_SYSTEM_DIR_INC} #Destination for the library headers (.h / .hpp)
        )

#Adds and handle files and installation.
#Calls the instructions inside "add-subdirectory.cmake" file.
#Notice that include() calls the instructions from the file without needing to re-define the variables.
include(utils/cmake/File-install.cmake)

# DIANA-Template Cpp - 2023
# Crafted with <3 by Thomas Galliano
