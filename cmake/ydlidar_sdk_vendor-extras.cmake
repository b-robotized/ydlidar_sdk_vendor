# Install prefix of this package: <prefix>/share/ydlidar_sdk_vendor/cmake
get_filename_component(_ydlidar_sdk_vendor_prefix "${ydlidar_sdk_vendor_DIR}/../../.." ABSOLUTE)

# Load the vendored SDK config directly: find_package(ydlidar_sdk) could pick up a system
# wide install (e.g. /usr/local) through a cached ydlidar_sdk_DIR
include("${_ydlidar_sdk_vendor_prefix}/lib/cmake/ydlidar_sdk/ydlidar_sdkConfig.cmake")

# Upstream config only provides the bare library name, so add the library directory
set(YDLIDAR_SDK_LIBRARY_DIRS "${_ydlidar_sdk_vendor_prefix}/lib" CACHE INTERNAL "YDLIDAR_SDK library directories" FORCE)

if(NOT TARGET ydlidar_sdk::ydlidar_sdk)
  add_library(ydlidar_sdk::ydlidar_sdk STATIC IMPORTED)
  set_target_properties(ydlidar_sdk::ydlidar_sdk PROPERTIES
    IMPORTED_LOCATION "${_ydlidar_sdk_vendor_prefix}/lib/libydlidar_sdk.a"
    INTERFACE_INCLUDE_DIRECTORIES "${YDLIDAR_SDK_INCLUDE_DIRS}"
    INTERFACE_LINK_LIBRARIES "pthread;rt")
endif()
