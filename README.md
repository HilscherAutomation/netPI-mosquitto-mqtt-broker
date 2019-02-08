## Mosquitto MQTT broker

[![](https://images.microbadger.com/badges/image/hilschernetpi/netpi-mosquitto-mqtt-broker.svg)](https://microbadger.com/images/hilschernetpi/netpi-mosquitto-mqtt-broker "Mosquitto MQTT Broker")
[![](https://images.microbadger.com/badges/commit/hilschernetpi/netpi-mosquitto-mqtt-broker.svg)](https://microbadger.com/images/hilschernetpi//netpi-mosquitto-mqtt-broker "Mosquitto MQTT Broker")
[![Docker Registry](https://img.shields.io/docker/pulls/hilschernetpi/netpi-mosquitto-mqtt-broker.svg)](https://registry.hub.docker.com/u/hilschernetpi/netpi-mosquitto-mqtt-broker/)&nbsp;
[![Image last updated](https://img.shields.io/badge/dynamic/json.svg?url=https://api.microbadger.com/v1/images/hilschernetpi/netpi-mosquitto-mqtt-broker&label=Image%20last%20updated&query=$.LastUpdated&colorB=007ec6)](http://microbadger.com/images/hilschernetpi/netpi-mosquitto-mqtt-broker "Image last updated")&nbsp;

Made for [netPI](https://www.netiot.com/netpi/), the Raspberry Pi 3B Architecture based industrial suited Open Edge Connectivity Ecosystem

### Debian with Mosquitto MQTT message server(broker)

The image provided hereunder deploys a container with installed Debian and a Mosquitto MQTT server. This makes it suitable for handling the "Internet of Things" message protocol MQTT as a broker. MQTT clients on localhost or local area networks can use this broker for message distribution in the publish/subscribe model based manner.

Base of this image builds [debian](https://www.balena.io/docs/reference/base-images/base-images/) and the [Mosquitto](https://mosquitto.org/) MQTT server in the version V1.4.14 supporting the MQTT protocol versions 3.1 and 3.1.1.

#### Container prerequisites

##### Port mapping

If the containerized MQTT server is used for message transactions of localhost MQTT clients hosted on netPI only then there is no need to map ports. Otherwise the ports 1883 and 8883 need to be mapped to free netPI host ports to get accessible over netPI's local area networks.

#### Getting started

STEP 1. Open netPI's website in your browser (https).

STEP 2. Click the Docker tile to open the [Portainer.io](http://portainer.io/) Docker management user interface.

STEP 3. Enter the following parameters under *Containers > + Add Container*

Parameter | Value | Remark
:---------|:------ |:------
*Image* | **hilschernetpi/netpi-mosquitto-mqtt-broker**
*Port mapping* | *host* **1883** -> *container* **1883** | *host*=any unused
*Port mapping* | *host* **8883** -> *container* **8883** | *host*=any unused
*Restart policy* | **always**

STEP 4. Press the button *Actions > Start/Deploy container*

Pulling the image may take a while (5-10mins). Sometimes it may take too long and a time out is indicated. In this case repeat STEP 4.

#### Accessing

The container starts Mosquitto daemon automatically when started.

Start your clients, let them know netPI's IP address and publish/subscribe your topics and messages as usual across the broker.

#### Automated build

The project complies with the scripting based [Dockerfile](https://docs.docker.com/engine/reference/builder/) method to build the image output file. Using this method is a precondition for an [automated](https://docs.docker.com/docker-hub/builds/) web based build process on DockerHub platform.

DockerHub web platform is x86 CPU based, but an ARM CPU coded output file is needed for Raspberry systems. This is why the Dockerfile includes the [balena](https://balena.io/blog/building-arm-containers-on-any-x86-machine-even-dockerhub/) steps.

#### License

View the license information for the software in the project. As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).
As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

[![N|Solid](http://www.hilscher.com/fileadmin/templates/doctima_2013/resources/Images/logo_hilscher.png)](http://www.hilscher.com)  Hilscher Gesellschaft fuer Systemautomation mbH  www.hilscher.com
