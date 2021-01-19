#!/bin/sh
cd ~
sudo apt-get update
sudo apt-get install -y git gperf flex bison libncurses5-dev gcc-arm-none-eabi python-pip
sudo pip install pyelftools
sudo apt-get install -y libusb-1.0-0-dev libftdi-dev libtool autoconf texinfo
sudo apt-get install -y libexpat1-dev zlib1g-dev guile-2.0-dev python2.7-dev