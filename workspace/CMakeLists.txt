cmake_minimum_required(VERSION 3.11...3.18)

project(fibonacci_generator)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

add_subdirectory(include)
add_subdirectory(src)

if (NOT CMAKE_BUILD_TYPE)
elseif (${CMAKE_BUILD_TYPE} STREQUAL "Debug")
        add_subdirectory(test)
elseif(${CMAKE_BUILD_TYPE} STREQUAL "Release")
        target_link_libraries(fibonacci_exe
            PUBLIC 
                -static
        )
endif()