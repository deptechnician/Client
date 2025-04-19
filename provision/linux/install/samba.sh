echo "------------------------------------------------------------------------"
echo " Samba installation and configuration"
echo "------------------------------------------------------------------------"

bash install/helper-apt.sh samba samba samba

# sudo adduser --no-create-home --disabled-login depbackup  # we'll use the dep user but this is another option
# sudo smbpasswd -a depbackup

sudo mkdir -p ~/backup/incoming
sudo mkdir -p ~/backup/snapshots
sudo chown dep:dep ~/backup/incoming
sudo chown dep:dep ~/backup/snapshots
sudo chmod 700 ~/backup/incoming
sudo chmod 700 ~/backup/snapshots

SMB_CONF="/etc/samba/smb.conf"
SECTION_NAME="[Backups]"

if ! grep -qF "$SECTION_NAME" "$SMB_CONF"; then
    echo "Adding $SECTION_NAME section to $SMB_CONF"
    cat <<EOF | sudo tee -a "$SMB_CONF" > /dev/null

$SECTION_NAME
   path = /home/dep/backup/incoming
   valid users = dep
   read only = no
   browseable = yes
EOF
else
    echo "$SECTION_NAME section already exists in $SMB_CONF"
fi

sudo systemctl restart smbd





