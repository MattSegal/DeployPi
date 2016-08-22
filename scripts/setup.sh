#! /bin/bash

# copy .bashrc - stomp everything
BASHRC=../.bashrc
sudo cp $BASHRC /etc/bash.bashrc
sudo cp $BASHRC ~/.bashrc

# set timezone to AEST
LOCALTIME=/etc/localtime
AEST=/usr/share/zoneinfo/Australia/Victoria

# Link AEST to localtime dir
rm $LOCALTIME
ln -s $AEST $LOCALTIME

# Setup ssh for easy putty access
PI_PUBLIC_KEY=../pi_key.pub
SSH_DIR=/.ssh

sudo mkdir $SSH_DIR
sudo cat $PI_PUBLIC_KEY >> $SSH_DIR/authorized_keys

# configure authorized keys in config
SSH_CONFIG='/etc/ssh/sshd_config'
sudo python find_and_replace.py $SSH_CONFIG '#AuthorizedKeysFile' 'AuthorizedKeysFile'
sudo python find_and_replace.py $SSH_CONFIG '%h/.ssh/authorized_keys' '/.ssh/authorized_keys'

# restart ssh service
sudo service ssh restart


# setup samba for sharing
sudo python add_samba_share.py pi_documents ~/Documents 

# restart samba
sudo service smbd restart

# check for samba syntax errors with
# testparm