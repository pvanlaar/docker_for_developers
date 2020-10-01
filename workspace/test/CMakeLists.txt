
find_package(gtest)

add_executable(fibonacci_tests
    FibonacciGeneratorTest.cpp
)

target_link_libraries(fibonacci_tests
    PRIVATE
        gtest
        gtest_main
        fibonacci_lib
)