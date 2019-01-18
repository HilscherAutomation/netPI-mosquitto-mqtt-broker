## Mosquitto MQTT broker

Made for [netPI](https://www.netiot.com/netpi/), the Raspberry Pi 3B Architecture based industrial suited Open Edge Connectivity Ecosystem

### Debian Stretch with Mosquitto MQTT message server(broker)

The image provided hereunder deploys a container with installed Debian Stretch and a Mosquitto MQTT server. This makes it suitable for handling the "Internet of Things" message protocol MQTT as a broker. MQTT clients on localhost or local area networks can use this broker for message distribution in the publish/subscribe model based manner.

Base of this image builds a tagged version of [debian:stretch](https://www.balena.io/docs/reference/base-images/base-images/) and the [Mosquitto](https://mosquitto.org/) MQTT server in the version V1.4.14 supporting the MQTT protocol versions 3.1 and 3.1.1.

#### Container prerequisites

##### Port mapping

If the containerized MQTT server is used for message transactions of localhost MQTT clients hosted on netPI only then there is no need to map ports. Otherwise the ports 1883 and 8883 need to be mapped to free netPI host ports to get accessible over netPI's local area networks.

#### Getting started

STEP 1. Open netPI's landing page under `https://<netpi's ip address>`.

STEP 2. Click the Docker tile to open the [Portainer.io](http://portainer.io/) Docker management user interface.

STEP 3. Enter the following parameters under **Containers > Add Container**

* **Image**: `hilschernetpi/netpi-mosquitto-mqtt-broker`

* **Port mapping**: `Host "1883" (any unused one) -> Container "1883"` `Host "8883" (any unused one) -> Container "8883"` 

* **Restart policy"** : `always`

STEP 4. Press the button **Actions > Start/Deploy container**

Pulling the image may take a while (5-10mins). Sometimes it takes so long that a time out is indicated. In this case repeat the **Actions > Start/Deploy container** action.

#### Accessing

The container starts Mosquitto daemon automatically.

Start your clients and publish/subscribe your topics and messages as usual.

#### Accessing

The container starts the SSH server automatically when started. Open a terminal connection to it with an SSH client such as [putty](http://www.putty.org/) using netPI's IP address at your mapped port.

As with a Raspberry Pi use the default credentials `pi` as user and `raspberry` as password when asked and you are logged in as non-root user `pi`.

Continue to use [Linux commands](https://www.raspberrypi.org/documentation/linux/usage/commands.md) in the terminal as usual.

#### Automated build

The project complies with the scripting based [Dockerfile](https://docs.docker.com/engine/reference/builder/) method to build the image output file. Using this method is a precondition for an [automated](https://docs.docker.com/docker-hub/builds/) web based build process on DockerHub platform.

DockerHub web platform is x86 CPU based, but an ARM CPU coded output file is needed for Raspberry systems. This is why the Dockerfile includes the [balena](https://balena.io/blog/building-arm-containers-on-any-x86-machine-even-dockerhub/) steps.

#### License

View the license information for the software in the project. As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).
As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

[![N|Solid](http://www.hilscher.com/fileadmin/templates/doctima_2013/resources/Images/logo_hilscher.png)](http://www.hilscher.com)  Hilscher Gesellschaft fuer Systemautomation mbH  www.hilscher.com
