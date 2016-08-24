# ===== SAMBA ======
# setup samba for sharing
sudo python add_samba_share.py pi_documents ~/Documents 

# restart samba
sudo service smbd restart

# check for samba syntax errors
testparm