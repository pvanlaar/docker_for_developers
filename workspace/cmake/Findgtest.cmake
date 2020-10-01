cmake_minimum_required(VERSION 3.11)
include(fetch_external_project)

if (NOT TARGET gtest)

    # default version
    if (NOT gtest_FIND_VERSION)
        set(gtest_FIND_VERSION 1.10.0)
    endif()

    fetch_external_project(
        NAME gtest
        URL https://github.com/google/googletest
        TAG release-${gtest_FIND_VERSION}
        CMAKE_ARGS "-DCMAKE_BUILD_TYPE=Release"
    )
endif()