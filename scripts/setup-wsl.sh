#!/bin/sh
sudo apt-get update
sudo apt-get install -y git gperf flex bison libncurses5-dev gcc-arm-none-eabi python-pip
sudo pip install pyelftools
#openocd
sudo apt-get install -y libusb-1.0-0-dev libftdi-dev libtool autoconf texinfo
git clone https://github.com/MotorolaMobilityLLC/openocd
cd openocd
git submodule init
git submodule update
./bootstrap
./configure --prefix=/usr/local
make
sudo make install
cd -
#GDB
sudo apt-get install -y libexpat1-dev zlib1g-dev guile-2.0-dev python2.7-dev
wget http://ftp.gnu.org/gnu/gdb/gdb-7.11.tar.gz
tar -zxf gdb-7.11.tar.gz
cd gdb-7.11
./configure --prefix=/usr/local --program-prefix=arm-none-eabi- --target=arm-none-eabi --with-python --with-guile
make
sudo make install
#nuttx kconfig-mconf
git clone https://github.com/MotorolaMobilityLLC/nuttx && \
./configure --enable-mconf --disable-nconf --disable-gconf --disable-qconf && \
make && \
sudo make install && \
sudo ldconfig