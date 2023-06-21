#-----------------------------------------------------------------------------
# Dummy project illustrating how to pass compiler flags etc.
#-----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# General setup (both are required).
# -----------------------------------------------------------------------------

# Specify minimum version of cmake; die if it's not available
cmake_minimum_required(VERSION 3.22 FATAL_ERROR)

# Invent a project name and specify the sources the we may come across
# so get cmake to find compilers for them!
project(demo_cmake C CXX Fortran)




# -----------------------------------------------------------------------------
# This sets c++ compiler flags for all executables.
#
# Note 1: CMAKE_CXX_FLAGS is different from CXX_FLAGS which simply
#         stores the CXX_FLAGS read in from the environment.
# Note 2: CMAKE_CXX_FLAGS can also be specified from the command line with
#         cmake -B build -G Ninja -D CMAKE_CXX_FLAGS="-g", say. We're not
#         overwriting/adding to this here. Puneet; comments please.
# -----------------------------------------------------------------------------
if ("${CMAKE_CXX_FLAGS}" STREQUAL "")
  message(STATUS  "CMAKE_CXX_FLAGS is empty; setting it here")
  set(CMAKE_CXX_FLAGS " -g")
else()
  message(STATUS  "CMAKE_CXX_FLAGS is not empty; not overwriting/adding")
endif()





# -----------------------------------------------------------------------------
# Specify specific flags and compiler options for executable
# -----------------------------------------------------------------------------
add_executable(
  cpp_demo
  cpp_demo.cc
  )

# This passes -DBLA to all compilers
target_compile_definitions(cpp_demo PUBLIC BLA)

# This adds compiler  flags to the compilation of specific targets
# Puneet: don't get the PUBLIC/PRIVATE/INTERFACE thing
target_compile_options(cpp_demo PUBLIC -Wuninitialized)



# -----------------------------------------------------------------------------
# Specify specific flags and compiler options for other executable
# -----------------------------------------------------------------------------
add_executable(
  cpp_demo_O6_blabla
  cpp_demo.cc
  )

# This passes -DBLABLA to all compilers
target_compile_definitions(cpp_demo_O6_blabla PUBLIC BLABLA)

# This adds compiler  flags to the compilation of specific targets
# Puneet: don't get the PUBLIC/PRIVATE/INTERFACE thing
target_compile_options(cpp_demo_O6_blabla PUBLIC -O6)





#---------------------------------------------------------------------------
# How to output stuff
#---------------------------------------------------------------------------

# Increase indentation for output generated from here; resets itself
# for any subsequent cmake-generated output.
list(APPEND CMAKE_MESSAGE_INDENT "    ")


# Just a message; variables are available via $ and curly brackets:
message(
  STATUS
  "My c++ compiler is: ${CMAKE_CXX_COMPILER}"
  )


# Can also output variables directly
include(CMakePrintHelpers)
cmake_print_variables(CXX_FLAGS)
cmake_print_variables(CMAKE_CXX_FLAGS)
cmake_print_variables(CMAKE_CXX_COMPILER)
