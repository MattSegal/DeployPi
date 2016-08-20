#! /bin/bash

# copy .bashrc - stomp everything
BASHRC=../.bashrc
sudo cp $BASHRC /etc/bash.bashrc
sudo cp $BASHRC /home/pi/.bashrc
sudo cp $BASHRC ~/.bashrc

# set timezone to AEST

LOCALTIME=/etc/localtime
AEST=/usr/share/zoneinfo/Australia/Victoria

# Link AEST to localtime dir
rm $LOCALTIME
ln -s $AEST $LOCALTIME

# Setup ssh for easy putty access
PI_PUBLIC_KEY=../pi_key.pub
SSH_DIR = /.ssh

sudo mkdir $SSH_DIR
sudo mk $SSH_DIR/authorized_keys
sudo cat $PI_PUBLIC_KEY >> $SSH_DIR/authorized_keys

cat $SSH_DIR/authorized_keys