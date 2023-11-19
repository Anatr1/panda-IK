#Utility file that contains the CMake checks for the project.

#check if In-source build is being performed: in this case, it stops the compilation.
if (" ${CMAKE_SOURCE_DIR}" STREQUAL " ${CMAKE_BINARY_DIR}")
  message(FATAL_ERROR "
	In-source builds are not allowed.
	Please, create a separate directory for build files (e.g. build/).
	Delete CMakeCache.txt, make a separate dir and try again.
	")
endif ()

#check modules libraries validity #todo: automate with a function
foreach(module ${DIANA_PROJECT_LIBRARIES})
  if(NOT IS_DIRECTORY ${DIANA_PROJECT_MODULES_FOLDER}/${module})
    message(FATAL_ERROR "ERROR! No module named ${module} inside ${DIANA_PROJECT_MODULES_FOLDER}.
    Please check the variables in utils/project_settings.cmake and a correspondent folder in ${DIANA_PROJECT_MODULES_FOLDER} ")
  endif()
endforeach()

#check modules programs validity #todo: automate with a function
foreach(module ${DIANA_PROJECT_PROGRAMS})
  if(NOT IS_DIRECTORY ${DIANA_PROJECT_MODULES_FOLDER}/${module})
    message(FATAL_ERROR "ERROR! No module named ${module} inside ${DIANA_PROJECT_MODULES_FOLDER}")
  endif()
endforeach()

#check modules services validity #todo: automate with a function
foreach(module ${DIANA_PROJECT_SERVICES})
  if(NOT IS_DIRECTORY ${DIANA_PROJECT_MODULES_FOLDER}/${module})
    message(FATAL_ERROR "ERROR! No module named ${module} inside ${DIANA_PROJECT_MODULES_FOLDER}")
  endif()
endforeach()

#check modules libraries validity #todo: automate with a function
foreach(module ${DIANA_PROJECT_TESTS})
  if(NOT IS_DIRECTORY ${DIANA_PROJECT_TESTS_FOLDER}/${module})
    message(FATAL_ERROR "ERROR! No module named ${module} inside ${DIANA_PROJECT_TESTS_FOLDER}.
    Please check the variables in utils/project_settings.cmake and a correspondent folder in ${DIANA_PROJECT_TESTS_FOLDER} ")
  endif()
endforeach()

# DIANA-Template Cpp - 2023
# Crafted with <3 and some >:( by Thomas Galliano
