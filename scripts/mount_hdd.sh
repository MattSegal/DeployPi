# ===== HARD DISK ======
# dmesg for startup output or dmesg | tail -n 20
# get list of mounted filesystems
# findmnt
# show installed drives
# sudo fdisk -l | grep '^Disk'
# another thing
# lsblk
# all the sd disks in dev
# ls /dev/ | grep sd
# get all usb devices
# lsusb

MOUNT_DISK="$1"
MOUNT_DIR="/media/hdd"

# make a folder
if [ ! -d "$DIRECTORY" ]; then
  sudo mkdir $MOUNT_DIR
fi

MOUNT_REFERENCES=$(mount | grep $MOUNT_DISK | wc -l)

if [ "$MOUNT_REFERENCES" -le "0" ]
then   
	# mount hdd
	sudo mount $MOUNT_DISK $MOUNT_DIR
fi


