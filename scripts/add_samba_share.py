import sys

share_data = {
    "folder_name" : sys.argv[1]
    "path" : sys.argv[2]
}

start_string = "# ===== START {folder_name} =====".format(**share_data)
end_string = "# ===== END {folder_name} =====".format(**share_data)

# no one said this was going to be pretty
samba_share_entry = '\n' + start_string + """ 
[{folder_name}]
comment = matt wuz here
path = {path}
browesable = yes
writable = yes
guest ok = yes
read only = no
create mask = 0777
directory mask = 0777
locking = yes
""".format(share_data) + '\n' + end_string + '\n'


SAMBA_CONFIG_FILE = "/etc/samba/smb.conf"

config = open(SAMBA_CONFIG_FILE).read()

if start_string in config:
    parts = config.split(start_string)
    parts = [parts[0]] + parts[1].split(end_string)
    parts[1] = samba_share_entry
    config = "".join(parts)
else:
    config += samba_share_entry


f = open(SAMBA_CONFIG_FILE, 'w')
f.write(config)
f.close()