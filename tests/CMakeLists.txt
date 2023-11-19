project(all_tests)

enable_testing()
add_subdirectory(googletest)

foreach(test ${DIANA_PROJECT_TESTS})
  add_subdirectory(${test})
endforeach()


# DIANA-Template Cpp - 2023
# Crafted with <3 and some >:( by Thomas Galliano
