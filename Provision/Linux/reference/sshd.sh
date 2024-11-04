# ---------------------------------------------------------------
# SSHD reference
# ---------------------------------------------------------------

# Installation: 
# ------------
sudo apt update && sudo apt upgrade -y
sudo apt install openssh-server

# Authorized keys
# ---------------
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
nano ~/.ssh/authorized_keys

# Lockdown configuration
# ----------------------
sudo nano /etc/ssh/sshd_config
	PubkeyAuthentication yes
	AuthorizedKeysFile %h/.ssh/authorized_keys
	PasswordAuthentication no
	PermitEmptyPasswords no
	PermitRootLogin no

# Lockdown configuration template
# -------------------------------
sudo cp ~/Code/setup/sshd_config /etc/ssh

# Copy the public key to the clipboard
#
xclip -sel clip < /home/seth/.ssh/sethflared.pub
xclip -o -sel clip

# Restart the service
# ----------------------
sudo systemctl restart ssh
