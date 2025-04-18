#!/bin/bash

echo "------------------------------------------------------------------------"
echo " Hardened (public key only) SSH Server"
echo "------------------------------------------------------------------------"

# Install the ssh server
#
sudo apt update && sudo apt upgrade -y
sudo apt install openssh-server -y

# Setup authorized keys
# ---------------------
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
cat ~/.ssh/authorized_keys

# Install the soft lockdown configuration
# ---------------------------------------
sudo cp ~/Code/Client/provision/linux/templates/sshd_config_hard /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "Completed hardened SSH Server configuration"
echo " "

