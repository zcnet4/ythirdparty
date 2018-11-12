#!/bin/bash
NDK_PATH="~/android-ndk-r12b"
echo "NDK_PATH:"${NDK_PATH}
cmake -DCMAKE_TOOLCHAIN_FILE=../third_party/android-cmake/android.toolchain.cmake \
      -DANDROID_NDK=${NDK_PATH}                                                   \
      -DANDROID_ABI="armeabi-v7a"                                                 \
      -DANDROID_STL="gnustl_shared"                                               \
      -DANDROID_NATIVE_API_LEVEL=19                                               \
      -DCMAKE_BUILD_TYPE=Release                                                  \
      ..
      
cmake --build .