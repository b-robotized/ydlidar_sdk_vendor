Upstream: [YDLidar-SDK](https://github.com/YDLIDAR/YDLidar-SDK), built from the fork [b-robotized-forks/YDLidar-SDK](https://github.com/b-robotized-forks/YDLidar-SDK) (branch `feat/update-cmake`) which fixes the build with CMake >= 4.

Builds the SDK and installs it into this package's install space, so no `sudo make install` is needed.

# Example usage:

`package.xml`
```
  <depend>ydlidar_sdk_vendor</depend>
```

`CMakeLists.txt`
```
find_package(ydlidar_sdk_vendor REQUIRED)

add_executable(test_node src/test_node.cpp)
target_link_libraries(test_node ydlidar_sdk::ydlidar_sdk)
```

The upstream variables `YDLIDAR_SDK_INCLUDE_DIRS`, `YDLIDAR_SDK_LIBRARIES` and `YDLIDAR_SDK_LIBRARY_DIRS` are set as well.

`.hpp` includes
```
#include "CYdLidar.h"
```
