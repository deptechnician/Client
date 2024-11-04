#!/bin/bash

echo "------------------------------------------------------------------------"
echo " Install Mullvad VPN"
echo "------------------------------------------------------------------------"

if command -v "mullvad" > /dev/null
then
    echo "Mullvad VPN is already installed"
else
    echo "Installing Mullvad VPN..."
    sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
    echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
    sudo apt update >> ~/.provision.log 2>> ~/.provision.log
    bash install/helper-apt.sh mullvad mullvad-vpn "Mullvad VPN"
fi


echo "Completed MNullvad VPN installation "
echo " "