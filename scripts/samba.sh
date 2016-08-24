# ===== SAMBA ======
# setup samba for sharing
sudo python add_samba_share.py pi_tv /media/hdd/tv_shows
sudo python add_samba_share.py pi_repos /media/hdd/repos
sudo python add_samba_share.py pi_torrents /media/hdd/torrents
sudo python add_samba_share.py pi_movies /media/hdd/movies
sudo python add_samba_share.py pi_music /media/hdd/music
sudo python add_samba_share.py pi_learning /media/hdd/learning 
sudo python add_samba_share.py pi_docs /media/hdd/docs
sudo python add_samba_share.py pi_photos /media/hdd/photos
sudo python add_samba_share.py pi_installers  /media/hdd/installers 

# restart samba
sudo service smbd restart

# check for samba syntax errors
testparm