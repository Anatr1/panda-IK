#include "ExampleClass.hpp"

#define CONFIG_FILE "../../../modules/ExampleLibrary/config/config.toml"

ExampleClass::ExampleClass(string shmemKey, int shmemSize, string topicName) : exampleReader(shmemKey, shmemSize),
                                        exampleWriter(shmemKey, shmemSize),
                                        exampleProperty(  topicName ,Property<std::string>::propertyAccessType::RW, false, false, true){
    // Code to run when new ExampleClass is created
    moquette_init();
}

ExampleClass::~ExampleClass() {
    // Moquette Cleanup and close connection
    MqttManager::cleanup();
}

/**
 * @brief Read config variables from Toml Config file
 */
void ExampleClass::toml_readConfig(){
    try {
        //Getting example_variable under example section in CONFIG_FILE
        const auto data = toml::parse(CONFIG_FILE);
        const auto example = toml::find(data, "example");
        int example_variable = toml::find<int>(example, "example_variable");

        //Send variable on Mqtt
        exampleProperty.setValue("Prova2");

        //Print the example variable
        std::cout << "example_variable: " << example_variable << std::endl;
    } catch (toml::exception &e) {
        std::cout << "Problems reading config file" << std::endl;
    }
}

/**
 * @brief Initialize Mqtt connection and properties
 */
void ExampleClass::moquette_init(){
    int count = 0;
    int max_tries = 3;
    bool connect_success = false;

    std::cout << "[ExampleLibrary]: trying to connect..." << std::endl;

    //try to init Moquette 3 times, then abort
    while (count <= max_tries && !connect_success){
        try {
            MqttManager::init("ExampleRover/ExampleLibrary/_state");
            connect_success = true;
        } catch (MqttException e){
            std::cout << "[ExampleLibrary::moquette_init]: failed connect attempt "<<count+1<< std::endl;
        }
    }
    if(!connect_success)
        throw std::runtime_error("Mqtt Broker connection failed!");

}

/**
 * @brief Saves example_variable on shared memory with shmem
 * @param example_variable Data to be stored
 */
void ExampleClass::shmem_write(int example_variable){
    this->exampleWriter[0] = example_variable; //put data inside Shared Memory
}

/**
 * @brief Reads example_variable from shared memory with shmem
 * @return Returns example_variable
 */
int ExampleClass::shmem_read(){
    //Access myReader data using "myReader[0]"
    return this->exampleReader[0];
}
