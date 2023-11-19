# Set the root folder where the module will be installed. As DIANA convention, it shall be the DIANA System utils directory
# (/usr/local/diana/utils/ExampleModule/...)
set(DIANA_MODULE_ROOTPATH ${DIANA_SYSTEM_DIR_LIB})

# add config files (can be relative or absolute path). They will automatically be installed in ${DIANA_SYSTEM_DIR_CFG} (by default /usr/local/diana/cfg/<moduleName>)
set(DIANA_MODULE_CONFIG_FILES ./config/config.toml)

#Set variable as the description for the module.
set(DIANA_MODULE_DESCRIPTION "C++ library to easily handle Inverse Kinematics for Panda robot arm.")

# add config files (can be both relative or absolute path).
# For each file, add then the name of the folder(and subfolders if necessary) containing it. The file will be automatically installed in
# the ${DIANA_MODULE_ROOTHPAT} (in case of Programs, by default /usr/local/diana/uti/<moduleName>)
# WARNING! Be sure to specify both variables!
set(DIANA_MODULE_FILES
    #"./exampleDirectory/ExampleFile.txt /exampleDirectory"
    # "a/path/to/file.txt the/dest/directory";
    # "../some/relative/path/file.txt /a/destionation/directory"
    )

# DIANA-Template Cpp - 2023
# Crafted with <3 and some >:( by Thomas Galliano
