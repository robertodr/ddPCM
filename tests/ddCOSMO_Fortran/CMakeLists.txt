add_executable(
    ddPCM.x
    main.f90
    efld.f90
    forces.f90
    mkrhs.f90
    )

target_link_libraries(
   ddPCM.x
   ddPCM
)

add_test(NAME ddCOSMO_Fortran
         COMMAND ${PYTHON_EXECUTABLE} ${PROJECT_SOURCE_DIR}/tests/ddCOSMO_Fortran/test.py --binary-dir=${PROJECT_BINARY_DIR}/bin --work-dir=${PROJECT_BINARY_DIR}/tests/ddCOSMO_Fortran --verbose
         WORKING_DIRECTORY ${PROJECT_BINARY_DIR}/tests/ddCOSMO_Fortran)
set_tests_properties(ddCOSMO_Fortran PROPERTIES LABELS "ddCOSMO;Fortran")

