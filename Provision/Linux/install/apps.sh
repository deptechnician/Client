
#!/bin/bash

echo "------------------------------------------------------------------------"
echo " App installation"
echo "------------------------------------------------------------------------"

echo "Removing Libre Office..."
sudo apt-get remove --purge "libreoffice*" -y >> ~/.provision.log 2>> ~/.provision.log

bash install/app-keepassxc.sh
bash install/rpi-imager.sh
bash install/app-brave.sh
bash install/app-vscodium.sh
bash install/app-chromium.sh
bash install/app-onlyoffice.sh
bash install/app-androidtools.sh

echo "Completed app installation "
echo " "
