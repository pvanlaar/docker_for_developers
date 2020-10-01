#include "FibonacciGenerator.hpp"

unsigned FibonacciGenerator::next()
{
    if (_firstCounter > 0)
    {
        _firstCounter--;
        return 1;
    }

    auto sum = _current + _previous; 
    _previous = _current;
    _current = sum;
    return _current;
}