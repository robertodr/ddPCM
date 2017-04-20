add_library(
    ddPCM
    ddcosmo.f90
    sphere_lebedev_rule.f90
    )
set_target_properties(ddPCM PROPERTIES COMPILE_FLAGS -D${PROJECT_NAME}_STATIC_DEFINE
                                       OUTPUT_NAME "ddPCM"
                                       EXPORT_NAME "ddPCM")

include(GenerateExportHeader)
generate_export_header(${PROJECT_NAME}
  BASE_NAME "ddPCM"
  EXPORT_MACRO_NAME "ddPCM_EXPORT"
  EXPORT_FILE_NAME "ddPCM_export.h"
  DEPRECATED_MACRO_NAME "ddPCM_DEPRECATED"
  NO_EXPORT_MACRO_NAME "ddPCM_NO_EXPORT"
  STATIC_DEFINE "ddPCM_STATIC_DEFINE"
  NO_DEPRECATED_MACRO_NAME "ddPCM_NO_DEPRECATED"
  DEFINE_NO_DEPRECATED)
file(COPY ${CMAKE_CURRENT_BINARY_DIR}/ddPCM_export.h DESTINATION ${PROJECT_BINARY_DIR}/include)
install(FILES ${PROJECT_BINARY_DIR}/include/ddPCM_export.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME})
