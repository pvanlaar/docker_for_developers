#include <chrono>
#include <iostream>
#include <thread>

#include "FibonacciGenerator.hpp"

int main(int argc, char* argv[])
{
    auto generator = FibonacciGenerator{};

    unsigned elementCount = 0;
    while(true)
    {
        std::cout << generator.next() << "-";
        std::cout.flush();
        std::this_thread::sleep_for(std::chrono::milliseconds(1000));
    }
}