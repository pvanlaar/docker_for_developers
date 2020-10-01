#include "FibonacciGenerator.hpp"

#include "gtest/gtest.h"

class FibonacciGeneratorTest : public ::testing::Test
{
    public:
    static FibonacciGenerator generator;
};

FibonacciGenerator FibonacciGeneratorTest::generator{};

TEST_F(FibonacciGeneratorTest, first)
{
    EXPECT_EQ(1, generator.next());
}
TEST_F(FibonacciGeneratorTest, second)
{

    EXPECT_EQ(1, generator.next());
}
TEST_F(FibonacciGeneratorTest, third)
{

    EXPECT_EQ(2, generator.next());
}
TEST_F(FibonacciGeneratorTest, fourth)
{

    EXPECT_EQ(3, generator.next());
}
TEST_F(FibonacciGeneratorTest, fifth)
{

    EXPECT_EQ(5, generator.next());
}
TEST_F(FibonacciGeneratorTest, sixth)
{

    EXPECT_EQ(8, generator.next());
}
TEST_F(FibonacciGeneratorTest, seventh)
{

    EXPECT_EQ(13, generator.next());
}