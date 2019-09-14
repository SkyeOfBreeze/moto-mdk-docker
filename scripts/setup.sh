#!/bin/sh
./configure --enable-mconf --disable-nconf --disable-gconf --disable-qconf
make
sudo make install
sudo ldconfig