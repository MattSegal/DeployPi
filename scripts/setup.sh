#! /bin/bash

# copy .bashrc - stomp everything
sudo cp ../.bashrc /etc/bash.bashrc
sudo cp ../.bashrc /home/pi/.bashrc
sudo cp ../.bashrc ~/.bashrc

# set timezone to AEST

LOCALTIME=/etc/localtime
AEST=/usr/share/zoneinfo/Australia/Victoria

rm $LOCALTIME
ln -s $AEST $LOCALTIME

# reload bash
bash
