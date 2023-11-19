#------------------------#
#-----Modify these: -----#
#------------------------#

#Project name
set(DIANA_PROJECT_NAME Panda-IK)

#Project version
set(DIANA_PROJECT_VERSION "0.0.1")

#Project Description
set(DIANA_PROJECT_DESCRIPTION "C++ library for inverse kinematics of the Franka Emika Panda robot")

#Modules in this project. Names must correspond to module names root, CMake
#Example: set(DIANA_PROJECT_SERVICES MYSERVICE1 anotherModule service2)

set(DIANA_PROJECT_LIBRARIES Panda-IK)
#set(DIANA_PROJECT_TESTS ExampleTest)


#TRUE enables tests, FALSE disables them (stuff from tests/ will not be built).
set(DIANA_TESTING_ENABLED FALSE)

#TRUE enables the export of DOXYGEN documentation on "cmake --target install". Installation may take longer.
set(DIANA_INSTALL_DOCUMENTATION_ENABLED FALSE)

#Sets the user that starts the service submodule(s). Leave it default as root if no modifications are needed.
#For software using SHMEM the username needs to be switched to the user (e.g. in ARDITO rover, the user is ardito)
set(DIANA_SERVICE_USER_NAME root)

#-------------------------------------------------------------#
#----- Change these only if you know what you are doing! -----#
#-------------------------------------------------------------#
#System directories: Directories where modules are installed.
#They are set as a convention (see CS Docs)..
set(DIANA_SYSTEM_DIR_ROOT /usr/local/diana)
set(DIANA_SYSTEM_DIR_SVC ${DIANA_SYSTEM_DIR_ROOT}/svc)
set(DIANA_SYSTEM_DIR_LIB ${DIANA_SYSTEM_DIR_ROOT}/lib)
set(DIANA_SYSTEM_DIR_LOG ${DIANA_SYSTEM_DIR_ROOT}/log)
set(DIANA_SYSTEM_DIR_CFG ${DIANA_SYSTEM_DIR_ROOT}/cfg)
set(DIANA_SYSTEM_DIR_INC ${DIANA_SYSTEM_DIR_ROOT}/include)
set(DIANA_SYSTEM_DIR_UTI ${DIANA_SYSTEM_DIR_ROOT}/utils)
set(DIANA_SYSTEM_DIR_SYS ${DIANA_SYSTEM_DIR_ROOT}/sys)
set(DIANA_SYSTEM_DIR_DOCS ${DIANA_SYSTEM_DIR_ROOT}/doc)

#This project directories
set(DIANA_SYSTEM_DIR_INCLUDE ${CMAKE_CURRENT_SOURCE_DIR}/include)
set(DIANA_PROJECT_UTILS_FOLDER ${CMAKE_CURRENT_SOURCE_DIR}/utils)
set(DIANA_PROJECT_MODULES_FOLDER ${CMAKE_CURRENT_SOURCE_DIR}/modules)
set(DIANA_PROJECT_TESTS_FOLDER ${CMAKE_CURRENT_SOURCE_DIR}/tests)
set(DIANA_PROJECT_DOCS ${CMAKE_CURRENT_SOURCE_DIR}/docs)

#compiler
set(CMAKE_C_COMPILER "/usr/bin/gcc")
set(CMAKE_CXX_COMPILER "/usr/bin/g++")
set(CMAKE_CUDA_COMPILER /usr/local/cuda-10.2/bin/nvcc)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wfatal-errors -pthread")

# DIANA-Template Cpp - 2023
# Crafted with <3 and some >:( by Thomas Galliano
