if(PROJECT_IS_TOP_LEVEL)
    set(
        CMAKE_INSTALL_INCLUDEDIR "include/widget-animation-framework-${PROJECT_VERSION}"
        CACHE PATH ""
    )
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# find_package(<package>) call for consumers to find this project
set(package widget-animation-framework)

install(
    DIRECTORY
    include/
    "${PROJECT_BINARY_DIR}/export/"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    COMPONENT widget-animation-framework_Development
)

install(
    TARGETS widget-animation-framework
    EXPORT widget-animation-frameworkTargets
    RUNTIME #
    COMPONENT widget-animation-framework_Runtime
    LIBRARY #
    COMPONENT widget-animation-framework_Runtime
    NAMELINK_COMPONENT widget-animation-framework_Development
    ARCHIVE #
    COMPONENT widget-animation-framework_Development
    INCLUDES #
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

write_basic_package_version_file(
    "${package}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)

# Allow package maintainers to freely override the path for the configs
set(
    widget-animation-framework_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/${package}"
    CACHE PATH "CMake package config location relative to the install prefix"
)
mark_as_advanced(widget-animation-framework_INSTALL_CMAKEDIR)

install(
    FILES cmake/install-config.cmake
    DESTINATION "${widget-animation-framework_INSTALL_CMAKEDIR}"
    RENAME "${package}Config.cmake"
    COMPONENT widget-animation-framework_Development
)

install(
    FILES "${PROJECT_BINARY_DIR}/${package}ConfigVersion.cmake"
    DESTINATION "${widget-animation-framework_INSTALL_CMAKEDIR}"
    COMPONENT widget-animation-framework_Development
)

install(
    EXPORT widget-animation-frameworkTargets
    NAMESPACE widget-animation-framework::
    DESTINATION "${widget-animation-framework_INSTALL_CMAKEDIR}"
    COMPONENT widget-animation-framework_Development
)

if(PROJECT_IS_TOP_LEVEL)
    include(CPack)
endif()
