# Set the root folder where the module will be installed. As DIANA convention, it shall be the DIANA System lib directory
# (/usr/local/diana/lib/ExampleService/...)
set(DIANA_MODULE_ROOTPATH ${DIANA_SYSTEM_DIR_SVC})

# Set the folder where the service files (start.sh, stop.sh, etc) are to be installed. As DIANA convention, it shall be
# (/usr/local/diana/lib/ExampleService/services/...)
set(DIANA_MODULE_SERVICES_FOLDER ${DIANA_SYSTEM_DIR_SVC})

#Set the variable as a description for the Service. Will be used as systemctl description
set(DIANA_MODULE_DESCRIPTION "This is an Example Service, used to do example stuff.")

# add config files (can be relative or absolute path). They will automatically be installed in ${DIANA_SYSTEM_DIR_CFG} (by default /usr/local/diana/cfg/<moduleName>)
set(DIANA_MODULE_CONFIG_FILES ./config/config.toml)

# add config files (can be both relative or absolute path).
# For each file, add then the name of the folder(and subfolders if necessary) containing it. The file will be automatically installed in
# the ${DIANA_MODULE_ROOTHPAT} (in case of Programs, by default /usr/local/diana/uti/<moduleName>)
# WARNING! Be sure to specify both variables!
set(DIANA_MODULE_FILES
    "./exampleDirectory/ExampleFile.txt /exampleDirectory"
    # "a/path/to/file.txt the/destination/directory";
    # "../some/relative/path/file.txt /a/destionation/directory"
    )

# DIANA-Template Cpp - 2023
# Crafted with <3 and some >:( by Thomas Galliano
