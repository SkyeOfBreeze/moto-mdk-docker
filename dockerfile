FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y wget git gperf flex bison libncurses5-dev gcc-arm-none-eabi python python-pip && \
pip install pyelftools

# openocd for usb
WORKDIR /home/workspace/dependencies
RUN apt-get install -y libusb-1.0-0-dev libftdi-dev libtool autoconf texinfo pkg-config gcc-5 && \ 
git clone https://github.com/MotorolaMobilityLLC/openocd && \ 
cd openocd && \ 
git submodule init && \ 
git submodule update && \ 
./bootstrap && \ 
./configure --prefix=/usr/local CC=gcc-5 && \ 
make && \
make install

# Not sure if below is needed
#OpenOCD talks to the chip through USB, so you need grant your account access to the FTDI.

# id -u -n
#Replace <user name> below with the results of the previous command.

# sudo -s
# echo 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="0403", MODE="0666", OWNER="<user name>"'  >> /etc/udev/rules.d/20-ftdi.rules
# udevadm control --reload
# exit
# The new permissions will take effect the next time you plug in your USB cable.

# gdb for debugging
WORKDIR /home/workspace/dependencies
RUN apt-get install -y libexpat1-dev zlib1g-dev guile-2.0-dev python2.7-dev && \
wget http://ftp.gnu.org/gnu/gdb/gdb-7.11.tar.gz && \
tar -zxf gdb-7.11.tar.gz && \
cd gdb-7.11 && \
./configure --prefix=/usr/local --program-prefix=arm-none-eabi- --target=arm-none-eabi --with-python --with-guile && \
make && \
make install

WORKDIR /home/workspace/mdk
