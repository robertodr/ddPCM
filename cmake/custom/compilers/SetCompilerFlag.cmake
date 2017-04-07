# Adapted by Roberto Di Remigio from https://github.com/SethMMorton/cmake_fortran_template/blob/master/cmake/Modules/SetCompileFlag.cmake
#
# Given a list of flags, this function will try each, one at a time,
#and choose the first flag that works.If no flags work, then nothing
# will be set, unless the REQUIRED key is given, in which case an error
# will be given.
#
# Call is:
# set_compile_flag(_flagvar _flagval (Fortran|C|CXX) <REQUIRED> flag1 flag2...)
#
# For example, if you have the flag CMAKE_C_FLAGS and you want to add
# warnings and want to fail if this is not possible, you might call this
# function in this manner:
# set_compile_flags(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}" C REQUIRED
#                   "-Wall"     # GNU
#                   "-warn all" # Intel
#                  )
# The optin "-Wall" will be checked first, and if it works, will be
# appended to the CMAKE_C_FLAGS variable. If it doesn't work, then
# "-warn all" will be tried.  If this doesn't work then checking will
# terminate because REQUIRED was given.
#
# The reason that the variable must be given twice (first as the name then
# as the value in quotes) is because of the way CMake handles the passing
# of variables in functions; it is difficult to extract a variable's
# contents and assign new values to it from within a function.
#
include(CheckCCompilerFlag)
include(CheckCXXCompilerFlag)
include(CheckFortranCompilerFlag)

function(set_compiler_flag _flagvar _flagval _lang)
  # Make a variable holding the flags. Filter out REQUIRED if it is there
  set(_flag_required FALSE)
  set(_flag_found FALSE)
  unset(_flaglist)
  foreach(var ${ARGN})
    string(TOUPPER "${var}" _up)
    if(_up STREQUAL "REQUIRED")
      set(_flag_required TRUE)
    else()
      set(_flaglist ${_flaglist} "${var}")
    endif()
  endforeach()

  unset(_possible_flag)
  # Now, loop over each flag
  foreach(flag ${_flaglist})
    unset(_flag_works)
    # Check the flag for the given language
    if(_lang STREQUAL "C")
      check_c_compiler_flag("${flag}" _flag_works)
    elseif(_lang STREQUAL "CXX")
      check_cxx_compiler_flag("${flag}" _flag_works)
    elseif(_lang STREQUAL "Fortran")
      check_Fortran_compiler_flag("${flag}" _flag_works)
    else()
      message(FATAL_ERROR "Unknown language in SET_COMPILER_FLAGS: ${_lang}")
    endif()
    set(_possible_flag "${flag}")

    # If this worked, use these flags, otherwise use other flags
    if(_flag_works)
      # Append this flag to the end of the list that already exists
      set(${_flagvar} "${_flagval} ${flag}" CACHE STRING "Set the ${_flagvar} flags" FORCE)
      set(_flag_found TRUE)
      break() # We found something that works, so exit
    endif()
  endforeach()

  # Raise an error if no flag was found
  if(_flag_required AND NOT _flag_found)
    message(FATAL_ERROR "The required compiler flag \"${_possible_flag}\" was NOT found")
  endif()
endfunction()
