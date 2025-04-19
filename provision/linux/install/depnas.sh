echo "------------------------------------------------------------------------"
echo " Install the standard configuration for DEP's nas"
echo "------------------------------------------------------------------------"

bash install/samba.sh

sudo mkdir -p ~/backup/incoming
sudo mkdir -p ~/backup/snapshots

sudo adduser --no-create-home --disabled-login depbackup
sudo smbpasswd -a depbackup
sudo smbpasswd -e depbackup
sudo chown depbackup:depbackup ~/backup/incoming
sudo chown depbackup:depbackup ~/backup/snapshots
sudo chmod 700 ~/backup/incoming
sudo chmod 700 ~/backup/snapshots

SMB_CONF="/etc/samba/smb.conf"
SECTION_NAME="[Backup]"

if ! grep -qF "$SECTION_NAME" "$SMB_CONF"; then
    echo "Adding $SECTION_NAME section to $SMB_CONF"
    cat <<EOF | sudo tee -a "$SMB_CONF" > /dev/null

$SECTION_NAME
   path = /home/dep/backup/incoming
   valid users = depbackup
   read only = no
   browseable = yes
EOF
else
    echo "$SECTION_NAME section already exists in $SMB_CONF"
fi

sudo systemctl restart smbd

sudo snap install nextcloud


