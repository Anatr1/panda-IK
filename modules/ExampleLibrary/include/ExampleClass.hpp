#ifndef __TEMPLATEPROJECT_EXAMPLE__HPP__
#define __TEMPLATEPROJECT_EXAMPLE__HPP__

#include <iostream>
#include <strings.h>
#include <toml.hpp>
#include <MqttManager.hpp>
#include <MqttException.hpp>
#include <Property.hpp>
#include <Shmem.hpp>
#include <Moquette2/MoquetteClient.hpp>

/**
 * @brief Simple example class: enables the user to read a variable from a TOML file, and publish it on SHMEM and Moquette.
 */
class ExampleClass{
public:
    /**
     * @brief constructor
     * @param shmemKey name of variable to
     * @param shmemSize
     * @param topicName
     */
    ExampleClass(string shmemKey, int shmemSize, string topicName );

    /**
    * @brief Destructor
    */
    ~ExampleClass();

    void toml_readConfig();

    void shmem_write(int example_variable);

    int shmem_read();

private:
    /**
    * @brief property for read and write on mqttTopic using Moquette
    */
    Property<std::string> exampleProperty;

    /**
     * @brief Object used to save data on shared memory
     */
    ShmemWriter<int> exampleWriter;

    /**
     * @brief Object used to read data from shared memory
     */
    ShmemReader<int> exampleReader;

    void moquette_init();
};

#endif // __TEMPLATEPROJECT_EXAMPLE__HPP__
