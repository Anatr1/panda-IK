#include <iostream>
#include <toml.hpp>
#include <unistd.h>
#include <Shmem.hpp>
#include <MqttManager.hpp>
#include <Property.hpp>
#include <ExampleInclude.hpp>

#include <Moquette2/MoquetteClient.hpp>
//#include "globalvariables.h"

using namespace std;

int main(void) {

    //root MQTT topic
    string topic = "ExampleRover/ExampleService/_state";
    //SHMEM key for shared object
    string SHMEM_key = "ExampleVariable_key";
    //Path for config file
    string configFilePath = "config/config.toml";
    int exampleVariable;

    // Instance a SHMEM writer
    ShmemWriter<int> writer(SHMEM_key, 1);
    // Instance a SHMEM reader
    ShmemReader<int> reader(SHMEM_key, 1);
    //Init Moquette Property
    Property<int> sender = Property<int>(topic, Property<int>::propertyAccessType::RW);

    //Init Moquette
    MqttManager::init(topic);

    //Parse config file
    auto data = toml::parse(configFilePath);
    auto exampleTable = toml::find(data, "example");
    exampleVariable  = toml::find<int>(exampleTable, "example_variable");

    // Call an exampleFunction() from ExampleInclude.
    int result = exampleFunction(0);

    //After setup is done, set status "ok"
    MqttManager::announceStatusOn();

    while(true){

        if (exampleVariable >= 100)
            exampleVariable = 0;

        //set value for SHMEM writer
        writer[0] = exampleVariable;

        //Send value over mqtt
        sender.setValue(exampleVariable);

        cout << "Sent ExampleVariable (" << exampleVariable<<") on MQTT"<<endl;

        //read variables
        cout << "ExampleVariable on SHMEM is"<< reader[0]<<endl;

        //print exampleVariable
        cout << "ExampleVariable is: "<<exampleVariable << endl;


        //do stuff here

        //Sleeping prevents the service from getting too much cpu-time.
        sleep(1);
    }

    //Close MQTT connection.
    MqttManager::cleanup();

    return 0;
}
