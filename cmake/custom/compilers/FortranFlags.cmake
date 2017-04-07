include(SetCompilerFlag)
# Overrides contents of all variables previously set by CMake
if(NOT DEFINED ENV{FCFLAGS})
  # CMAKE_Fortran_FLAGS
  set_compiler_flag(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS}" Fortran REQUIRED
                    "-std=f2003" # GNU
                    "-std03"     # Intel
                    "-Mfree -Mallocatable=03 -Mstandard" # PGI
                    )
  set_compiler_flag(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS}" Fortran REQUIRED
                    "-fimplicit-none" # GNU
                    "-implicitnone"   # Intel
                    "-Mdclchk" # PGI
                    )
  set_compiler_flag(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS}" Fortran
                    "-fautomatic" # GNU
                    )
  set_compiler_flag(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS}" Fortran
                    "-fmax-errors=5" # GNU
                    "-diag-error-limit5" # Intel
                    )

  # CMAKE_Fortran_FLAGS_DEBUG: contains -O0 already
  set_compiler_flag(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG}" Fortran REQUIRED
                    "-O0" # GNU, Intel, PGI
                    )
  set_compiler_flag(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG}" Fortran REQUIRED
                    "-Wall" # GNU
                    "-warn all" # Intel
                    "-Minform=warn" # PGI
                    )
  set_compiler_flag(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG}" Fortran REQUIRED
                    "-fbacktrace" # GNU
                    "-traceback"  # Intel and PGI
                    )
  set_compiler_flag(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG}" Fortran REQUIRED
                    "-fbounds-check -finit-local-zero" # GNU
                    "-check all -ftrapuv"  # Intel
                    "-Ktrap=fp -Mbounds -Mchkptr -Mchkfpstk -Mchkstk" # PGI
                    )

  # CMAKE_Fortran_FLAGS_RELEASE: contains -O3 -DNDEBUG already
  set_compiler_flag(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE}" Fortran REQUIRED
                    "-march=native" # GNU
                    "-xHost"        # Intel
                    "-fast"         # PGI
                    )
  set_compiler_flag(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE}" Fortran
                    "-funroll-loops" # GNU and Intel
                    )
  set_compiler_flag(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE}" Fortran
                    "-ftree-vectorize" # GNU
                    )
endif()
