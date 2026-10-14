cmake_minimum_required(VERSION 3.10)
project(ydlidar_sdk_vendor)

find_package(ament_cmake REQUIRED)

# The SDK uses CMAKE_SOURCE_DIR in its install logic, so it can not be pulled in with
# FetchContent/add_subdirectory and is built as a separate ExternalProject instead.
include(ExternalProject)
ExternalProject_Add(
    ydlidar_sdk
    # fork with the build fixed for CMake >= 4
    GIT_REPOSITORY  https://github.com/b-robotized-forks/YDLidar-SDK.git
    GIT_TAG         feat/update-cmake
    GIT_SHALLOW     true
    # force install to current package install
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
        -DCMAKE_BUILD_TYPE=Release
        -DBUILD_SHARED_LIBS=OFF
        -DBUILD_EXAMPLES=OFF
        -DBUILD_TEST=OFF
        -DBUILD_CSHARP=OFF
)

ament_package(
  CONFIG_EXTRAS "cmake/ydlidar_sdk_vendor-extras.cmake"
)
