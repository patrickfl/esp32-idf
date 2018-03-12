#
# esp32-idf 
#
FROM debian:latest
MAINTAINER Patrick Flaig

RUN apt-get update
RUN apt-get --no-install-recommends install -y git wget make libncurses-dev flex bison gperf python python-serial
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/esp
RUN wget -P /home/esp https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN tar --directory=/home/esp -xzf /home/esp/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN rm /home/esp/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz

ENV PATH="${PATH}:/home/esp/xtensa-esp32-elf/bin"
WORKDIR /home/esp

RUN git clone --recursive https://github.com/espressif/esp-idf.git
ENV IDF_PATH=/home/esp/esp-idf
