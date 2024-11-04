
#!/bin/bash

echo "------------------------------------------------------------------------"
echo " App installation"
echo "------------------------------------------------------------------------"

if [[ -d ~/Apps ]]
then
    echo "~/Apps directory already exists"
else
    mkdir ~/Apps
fi

# Remove any unwanted apps that are installed by default
#
echo "Removing unwanted apps..."
echo "Removing Libre Office..."
sudo apt-get remove --purge "libreoffice*" -y >> ~/.provision.log 2>> ~/.provision.log

echo "Installing desired apps..."
bash install/helper-apt.sh keepassxc keepassxc "KeePassXC"
bash install/helper-apt.sh rpi-imager rpi-imager "RPI Imager"

#bash install/helper-flatpak.sh com.nextcloud.desktopclient.nextcloud "NextCloud Desktop Client"
bash install/helper-flatpak.sh com.brave.Browser "Brave Browser"
bash install/helper-flatpak.sh com.vscodium.codium "VS Codium"
bash install/helper-flatpak.sh org.chromium.Chromium "Chromium Browser"
bash install/helper-flatpak.sh org.freefilesync.FreeFileSync "FreeFileSync"
bash install/helper-flatpak.sh ch.protonmail.protonmail-bridge  "Proton Mail Bridge"
bash install/helper-flatpak.sh com.github.micahflee.torbrowser-launcher "Tor Browser"
bash install/helper-flatpak.sh org.onlyoffice.desktopeditors "Only Office Desktop"

bash install/helper-apt.sh adb "Android Debug Bridge"
bash install/helper-apt.sh android-tools-adb "Android Debugging Tools"

echo "Completed app installation "
echo " "
