#ifndef FIBONACCI_HPP
#define FIBONACCI_HPP

class FibonacciGenerator
{
    public:
        unsigned next();

    private:
    unsigned _current = 1;
    unsigned _previous = 1;
    unsigned _firstCounter = 2;
};

#endif // FIBONACCI_HPP