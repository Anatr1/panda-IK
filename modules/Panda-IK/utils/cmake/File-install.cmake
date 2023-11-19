#This file contains installation rules and targets for your module.

message("Config files: ")

# Iterate over configuration files.
# This loop handles: installation of files, trigger the need to re-build when these files are modified, creation of header file with file names as variables.
foreach(FILE ${DIANA_MODULE_CONFIG_FILES})

  #Get the absolute path of config file, if not set (don't).
  get_filename_component(FILE ${FILE} ABSOLUTE ${CMAKE_CURRENT_LIST_DIR})

  #Convert to File path to CMake path
  file(TO_CMAKE_PATH "${FILE}" FILE)

  #Get the file name (stripped from path)
  get_filename_component(file_name ${FILE} NAME)

  #Check existence of file. Crash if not existing
  if(EXISTS "${FILE}")
  else()
    message(FATAL_ERROR "DIANA CMake: Error on evaluating config file ${FILE}, in DIANA_MODULE_CONFIG_FILES variable. Not a valid path or not existing!")
  endif()

  #Copy file inside build folder, if changed.
  add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD
                     DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${FILE}
                     COMMAND ${CMAKE_COMMAND} -E copy_if_different
                     ${FILE} $<TARGET_FILE_DIR:${PROJECT_NAME}>/cfg/${file_name}
                     )

  #On "cmake --target install" command, add the files to installed folder
  install(FILES ${FILE}
          DESTINATION ${DIANA_SYSTEM_DIR_CFG}/${PROJECT_NAME})

  #add the file as source property: complete build will be triggered on file change
  set_property(SOURCE main.cpp APPEND PROPERTY OBJECT_DEPENDS ${FILE})

  #Add the file name to the list MYFILES_DEFINES, that will be used then to configure ${ModuleName}_cmakevariables.h.in
  #Get the file name
  get_filename_component(file_name ${FILE} NAME)
  #Replace the dot with a _ : this is used for the defined variable
  string(REPLACE "." "_" file_name ${file_name})
  #Convert file name to upper case
  string(TOUPPER ${file_name} file_name)
  #append DIANA_CONFIG_FILE_... to the file name
  set(file_name "DIANA_${PROJECT_NAME}_CFG_FILE_${file_name}")

  #Append to the list ${MYFILES_DEFINES_INSTALLED} created here the text to be copied in the header file
  list(APPEND MYFILES_DEFINES_INSTALLED "#define ${file_name} \"${FILE}\"")
  #replace the \n caracter (contained in ${MYFILES_DEFINES_INSTALLED}, a space is added when a new variable is appended) with ";"
  string(REPLACE ";" "\n" MYFILES_DEFINES "${MYFILES_DEFINES}")

  message("adding file ${FILE} to project.\n\tWill be installed in ${DIANA_SYSTEM_DIR_CFG}/${PROJECT_NAME}\n\tWill be #defined as ${Cyan}${file_name}${ColourReset} in ${PROJECT_NAME}_cmakevariables.h")
endforeach()


message("Other files: ")

#Iterate over module files.
# Iterate over user-defined files.
# This loop handles: installation of files, trigger the need to re-build when these files are modified, creation of header file with file names as variables.
foreach(file_dest ${DIANA_MODULE_FILES})

  string(REPLACE " " ";" file_dest ${file_dest})
  #Since we are iterating over a list, get the file name, and the destination folder
  list(GET file_dest 0 FILE)
  list(GET file_dest 1 DEST)

  #Convert to File path to CMake path
  file(TO_CMAKE_PATH "${FILE}" FILE)

  #Sets ${FILE} to absoolute if not already
  get_filename_component(FILE ${FILE} ABSOLUTE ${CMAKE_CURRENT_LIST_DIR})

  #Check existance of file. Crash if not existing
  if(EXISTS "${FILE}")
  else()
    message(FATAL_ERROR "DIANA CMake: Error on evaluating file ${FILE} (with dest set as ${DEST}), in DIANA_MODULE_FILES variable: not a valid path!")
  endif()

  #Get the file name (stripped from path)
  get_filename_component(file_name ${FILE} NAME)

  #Check if destination folder begins with a / . If yes, remove it.
  string(SUBSTRING ${DEST} 0 1 first_char)
  if(${first_char} STREQUAL "/")
    string(SUBSTRING ${DEST} 1 -1 DEST)
  endif()

  #Copy file inside build folder, if changed.
  add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD
                     DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/${DEST}/${file_name}
                     COMMAND ${CMAKE_COMMAND} -E copy_if_different
                     ${FILE}  $<TARGET_FILE_DIR:${PROJECT_NAME}>/${DEST}/${file_name}
                     )

  #On "cmake --target install" command, add the files to installed folder
  install(FILES ${FILE}
          DESTINATION ${DIANA_MODULE_ROOTPATH}/${PROJECT_NAME}/${DEST})

  #add the file as source property: complete build will be triggered on file change
  set_property(SOURCE main.cpp APPEND PROPERTY OBJECT_DEPENDS ${FILE})

  #Add the file name to the list MYFILES_DEFINES, that will be used then to configure ${ModuleName}_cmakevariables.h.in
  #Replace the dot with a _ : this is used for the defined variable
  string(REPLACE "." "_" file_name ${file_name})
  #Convert file name to upper case
  string(TOUPPER ${file_name} FILE_NAME_UPPER)
  #append DIANA_CONFIG_FILE_... to the file name
  set(FILE_NAME_UPPER "DIANA_${PROJECT_NAME}_FILE_${FILE_NAME_UPPER}")

  #set(${file_name} ${file})
  #Append to the list ${MYFILES_DEFINES_INSTALLED} created here the text to be copied in the header file
  list(APPEND MYFILES_DEFINES_INSTALLED "#define ${FILE_NAME_UPPER} \"${DIANA_MODULE_ROOTPATH}/${PROJECT_NAME}/${DEST}/${file_name}\"")
  #replace the \n caracter (contained in ${MYFILES_DEFINES_INSTALLED}, a space is added when a new variable is appended) with ";"
  string(REPLACE ";" "\n" MYFILES_DEFINES_INSTALLED "${MYFILES_DEFINES_INSTALLED}")

  message("adding file ${FILE} to project.\n\tWill be installed in ${DIANA_MODULE_ROOTPATH}/${PROJECT_NAME}/${DEST}\n\tWill be #defined as ${Cyan}${FILE_NAME_UPPER}${ColourReset} in ${PROJECT_NAME}_cmakevariables.h")
endforeach()

#Execute commands in configure-header-file.cmake (commands to configure the header file)
include(utils/cmake/configure-header-file.cmake)

# DIANA-Template Cpp - 2023
# Crafted with <3 by Thomas Galliano
