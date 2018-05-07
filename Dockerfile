#use latest armv7hf compatible raspbian OS version from group resin.io as base image
FROM resin/armv7hf-debian:stretch

#enable building ARM container on x86 machinery on the web (comment out next line if built on Raspberry) 
RUN [ "cross-build-start" ]

#labeling
LABEL maintainer="netpi@hilscher.com" \
      version="V0.9.2" \
      description="Debian Stretch with Mosquitto MQTT broker"

#version
ENV HILSCHERNETPI_MOSQUITTO_MQTT_BROKER 0.9.2

#copy files
COPY "./init.d/*" /etc/init.d/

#do installation
RUN apt-get update \
    && apt-get install cmake libssl1.0-dev \
    && apt-get install libwebsockets-dev uuid-dev wget build-essential \
#get latest mosquitto source code
    && cd /tmp \
    && wget http://mosquitto.org/files/source/mosquitto-1.4.14.tar.gz \
    && tar xavf mosquitto-1.4.14.tar.gz \
#compile mosquitto
    && cd mosquitto-1.4.14 \
    && cmake -DWITH_WEBSOCKETS=ON . \
    && make -j4 \
    && make install \
#make mosquitto runnable
    && adduser --system --disabled-password --disabled-login mosquitto \
    && mkdir /etc/mosquitto/ /etc/mosquitto/conf.d /var/log/mosquitto/ \
    && chown -R mosquitto /var/log/mosquitto/ \
#clean up
    && rm -rf /tmp/* \
    && apt-get remove build-essential wget cmake \
    && apt-get -yqq autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

#do ports
EXPOSE 1880 8883

#do startscript
ENTRYPOINT ["/etc/init.d/entrypoint.sh"]

#set STOPSGINAL
STOPSIGNAL SIGTERM

#stop processing ARM emulation (comment out next line if built on Raspberry)
RUN [ "cross-build-end" ]
