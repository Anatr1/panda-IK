# DIANA-Template Cpp - 2023
# Crafted with <3 by Thomas Galliano


configure_file(utils/module_cmakevariables.h.in ${MAIN_BUILD_DIR}/${PROJECT_NAME}_cmakevariables.h)

#Append on configured files the paths to the
file(APPEND ${MAIN_BUILD_DIR}/${PROJECT_NAME}_cmakevariables.h "${MYFILES_DEFINES_INSTALLED}\n#endif\n//This file was Automatically generated for module ${PROJECT_NAME} by Diana Template.")

# DIANA-Template Cpp - 2023
# Crafted with <3 and some >:( by Thomas Galliano
