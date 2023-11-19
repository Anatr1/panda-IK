#Utility file that prints the variables

#include colors and functions in project settings
include(utils/cmake/CMake_Colors.cmake)

message("${BoldCyan}DIANA C++ TEMPLATE${ColourReset}")
message("")
message("${BoldCyan}Project ${PROJECT_NAME}${ColourReset}" )
message("${Cyan}OS detected: ${ColourReset}" ${CMAKE_SYSTEM_NAME} " ${Cyan}CMAKE SYSTEM: ${ColourReset}" ${CMAKE_SYSTEM_NAME})
message("${Cyan}Compiler: ${ColourReset}" ${CMAKE_C_COMPILER})
message("${Cyan}C++ Compiler:${ColourReset} " ${CMAKE_CXX_COMPILER})
message("${Cyan}C++ Flags:${ColourReset} " ${CMAKE_CXX_FLAGS})
message("${Cyan}Testing enabled:${ColourReset}" ${DIANA_TESTING_ENABLED})
message("${Cyan}GTest directory: ${ColourReset}" ${DIANA_Gtest_SOURCE_DIR})
message("${Cyan}Doxygen documentation upon installation enabled: ${ColourReset}" ${DIANA_INSTALL_DOCUMENTATION_ENABLED})

#DIANA System directories
message("")
message("${BoldCyan}Installation Directories ${ColourReset}")
message("${Cyan}DIANA System root: ${ColourReset}" ${DIANA_SYSTEM_DIR_ROOT})
message("${Cyan}DIANA System service directory: ${ColourReset}" ${DIANA_SYSTEM_DIR_SVC})
message("${Cyan}DIANA System lib directory: ${ColourReset}" ${DIANA_SYSTEM_DIR_LIB})
message("${Cyan}DIANA System logs directory: ${ColourReset}" ${DIANA_SYSTEM_DIR_LOG})
message("${Cyan}DIANA System config directory ${ColourReset}" ${DIANA_SYSTEM_DIR_CFG})
message("${Cyan}DIANA System include directory ${ColourReset}" ${DIANA_SYSTEM_DIR_INC})
message("${Cyan}DIANA System utils directory ${ColourReset}" ${DIANA_SYSTEM_DIR_UTI})
message("${Cyan}DIANA System system directory ${ColourReset}" ${DIANA_SYSTEM_DIR_SYS})
message("${Cyan}DIANA System documentation directory ${ColourReset}" ${DIANA_SYSTEM_DIR_DOCS})

message("")
#This project folders
message("${BoldCyan}This Project ${ColourReset}")
message("${Cyan}This project's util folder: ${ColourReset}" ${DIANA_PROJECT_UTILS_FOLDER})
message("${Cyan}This project's modules folder: ${ColourReset}" ${DIANA_PROJECT_MODULES_FOLDER})
message("${Cyan}This project's modules (libraries): ${ColourReset}" ${DIANA_PROJECT_LIBRARIES})
message("${Cyan}This project's modules (programs): ${ColourReset}" ${DIANA_PROJECT_PROGRAMS})
message("${Cyan}This project's modules (services): ${ColourReset}" ${DIANA_PROJECT_SERVICES})
message("${Cyan}This project's tests:${ColourReset}" ${DIANA_PROJECT_TESTS})

message("Notice: these parameters can be changed in utils/project_settings.cmake")
message("")
message("")

# DIANA-Template Cpp - 2023
# Crafted with <3 and some >:( by Thomas Galliano
