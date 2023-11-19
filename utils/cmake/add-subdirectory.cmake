#User-defined file to add the subdirectories

foreach(module ${DIANA_PROJECT_LIBRARIES})
  add_subdirectory(${DIANA_PROJECT_MODULES_FOLDER}/${module})
endforeach()

foreach(module ${DIANA_PROJECT_PROGRAMS})
  add_subdirectory(${DIANA_PROJECT_MODULES_FOLDER}/${module})
endforeach()

foreach(module ${DIANA_PROJECT_SERVICES})
  add_subdirectory(${DIANA_PROJECT_MODULES_FOLDER}/${module})
endforeach()

#Enable tests and add test subdirectories if the variable is set TRUE (in project_settings)
if(${DIANA_TESTING_ENABLED} )
  add_subdirectory(${DIANA_PROJECT_TESTS_FOLDER})
endif()

# DIANA-Template Cpp - 2023
# Crafted with <3 and some >:( by Thomas Galliano
