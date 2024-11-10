# ---------------------------------------------------------------
# Kali linux reference
# ---------------------------------------------------------------

# Build the driver for the TP-Link AC600
#
sudo apt install git dkms
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au
sudo make dkms_install
#The following commands are only needed if there was already a driver present and you're updating
# sudo mv /var/lib/8812au /var/lib/8812au-orig
# sudo make dkms_install

# Show available wifi
#
nmcli dev wifi
