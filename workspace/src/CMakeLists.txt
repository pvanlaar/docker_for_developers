
add_library(fibonacci_lib
    FibonacciGenerator.cpp
)

target_link_libraries(fibonacci_lib
    PUBLIC
        fibonacci_headers
)

add_executable(fibonacci_exe
    main.cpp
)

target_link_libraries(fibonacci_exe
    PRIVATE
        fibonacci_lib
)
