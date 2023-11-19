#include "gtest/gtest.h"
#include <iostream>
#include "ExampleClass.hpp"

TEST(TestSuiteName, TestName) {

    ExampleClass example("example_key", 1, "ExampleTopicTest");

    example.toml_readConfig();

    example.shmem_write(15);

    sleep(2);
    int example_variable = example.shmem_read();

    std::cout << example_variable <<std::endl;

    EXPECT_EQ(1, 1);
}

