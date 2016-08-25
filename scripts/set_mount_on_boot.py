import sys

disk_name = sys.argv[1]
mount_target = sys.argv[2]

mount_entry = "\n{0}      {1}   auto   defaults   0   0\n"
    .format(disk_name,mount_target)

MOUNT_ON_BOOT_FILE = "/etc/fstab"

with open(MOUNT_ON_BOOT_FILE,'rw') as f:
    config = f.read()
    if mount_entry not in config:
        config += mount_entry
        f.write(config)
