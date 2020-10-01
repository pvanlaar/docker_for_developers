add_library(fibonacci_headers INTERFACE)

target_include_directories(fibonacci_headers
    INTERFACE
        ${CMAKE_CURRENT_LIST_DIR}
)