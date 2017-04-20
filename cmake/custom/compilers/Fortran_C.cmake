# Checks Fortran and C compilers compatibility, relying on the
# FortranCInterface CMake module.
# The FCMangle.h header will be generated. This header contains macros
# to perform the correct name mangling of Fortran/C interfacing
# subroutines/functions.

include(FortranCInterface)
FortranCInterface_VERIFY()
FortranCInterface_HEADER(${PROJECT_BINARY_DIR}/include/FCMangle.h)
install(FILES ${PROJECT_BINARY_DIR}/include/FCMangle.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})
