#Name of service
project(ExampleService)

#C++ Standard
set(CMAKE_CXX_STANDARD 17)

#Include the module-settings.cmake, for utils settings.
include(utils/cmake/module-settings.cmake)

#Adds the path defined in ${DIANA_SYSTEM_DIR_LIB} (contains all the DIANA installed libraries, following conventions) as a path for the linker to look for.
link_directories(${DIANA_SYSTEM_DIR_LIB})
#Adds the path defined in ${DIANA_SYSTEM_DIR_INC} (contains all the DIANA installed headers, following conventions) to be able to found the includes for DIANA libraries
include_directories(${DIANA_SYSTEM_DIR_INC})

#Print Name
message("${BoldMagenta}${PROJECT_NAME}${ColourReset}")

#Add executable files
add_executable(${PROJECT_NAME} main.cpp include/ExampleInclude.cpp include/ExampleInclude.hpp)

#Files inside the include folder can be added directly via #include <myfile.h> . No need for paths.
include_directories(include)

#Includes the main build directory (e.g. the build folder, or cmake-build-*), containing the header file "project_globalvariables.h"
#This way you can include and use the declared variables in your C++ file.
include_directories(${MAIN_BUILD_DIR})

#Find libraries
find_package(toml11 REQUIRED
             #Add here a new line here
             )

#Tell the linker to add libraries
target_link_libraries(${PROJECT_NAME}
                      toml11::toml11  #Toml Library for setting files
                      Moquette        #DIANA Mqtt Shared Library
                      rt              #rt, needed by SHMEM
                      Shmem           #DIANA Shared Memory Library
                      Moquette2       #Updated version of Moquette
                                      # <- Add a line here to link libraries
                      )

include(utils/cmake/File-install.cmake)

include(utils/cmake/service-install.cmake)

# DIANA-Template Cpp - 2023
# Crafted with <3 and some >:( by Thomas Galliano
