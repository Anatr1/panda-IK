#Project name
project(ExampleTest)
set(CMAKE_CXX_STANDARD 17)

#Add Colors
include(${DIANA_PROJECT_UTILS_FOLDER}/cmake/CMake_Colors.cmake)

#Print Name
message("${BoldMagenta}${PROJECT_NAME}${ColourReset}")

# Add the executable(s) containing the test(s). Notice: Not necessary to add a main.cpp!
add_executable(${PROJECT_NAME} ExampleLibrary_test.cc ${DIANA_PROJECT_MODULES_FOLDER}/ExampleLibrary/include/ExampleClass.hpp ${DIANA_PROJECT_MODULES_FOLDER}/ExampleLibrary/source/ExampleClass.cpp)

#Include files from include/ directory in library module.
#This means all headers from these directories are accessible with a #include <Something.h> or #include "Something.h", no relative or full path necessary.
include_directories(${DIANA_PROJECT_MODULES_FOLDER}/ExampleLibrary/include)

# Add the subdirectory containing gtest
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})

#include_directories(${DIANA_Gtest_SOURCE_DIR})

#Finds libraries that need to be linked.
#Notice: the files (.cpp, .h...)that you will test will be build using this CMake, while the module is not used! So you need to link all the necessary libraries here.
find_package(toml11 REQUIRED
             #Add here a new line here
             )

#Add tests to CMake. It makes the target having the same name available in your CLion configurations
add_test(NAME    ${PROJECT_NAME}
         COMMAND ${PROJECT_NAME})

#Link libraries against the executable
target_link_libraries(${PROJECT_NAME}
                      gtest gtest_main
                      pthread
                      toml11::toml11
                      Moquette
                      rt
                      Shmem
                      ## Add a line here to link other libraries
                      )

#Print new line
message("")

# DIANA-Template Cpp - 2023
# Crafted with <3 by Thomas Galliano
