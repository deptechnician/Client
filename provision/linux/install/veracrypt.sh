#!/bin/bash

echo "------------------------------------------------------------------------"
echo " Download, compile, and install the veracrypt CLI"
echo "------------------------------------------------------------------------"

pushd . > /dev/null

if [[ -f /usr/bin/veracrypt ]]
then
    echo "Veracrypt is already installed"
else
    bash install/helper-apt.sh g++ g++ "g++ compiler"
    bash install/helper-apt.sh libfuse-dev libfuse-dev "libfuse-dev"
    bash install/helper-apt.sh pkg-config pkg-config "pkg-config"
    bash install/helper-apt.sh yasm yasm "yasm"
    bash install/helper-apt.sh libwxgtk3.2-dev libwxgtk3.2-dev "libwxgtk3.2-dev"
    bash install/helper-apt.sh libpcsclite-dev libpcsclite-dev "libpcsclite-dev"

    mkdir ~/Apps
    mkdir ~/Apps/veracrypt >> ~/.provision.log
    cd ~/Apps/veracrypt >> ~/.provision.log

    VERSION="VeraCrypt_1.26.7"

    if [[ ! -f ./$VERSION.tar.gz ]]; then
        echo "Downloading veracrypt..."
        wget https://www.veracrypt.fr/code/VeraCrypt/snapshot/$VERSION.tar.gz >> ~/.provision.log
        tar -xvf $VERSION.tar.gz >> ~/.provision.log
    fi

    echo "Compiling veracrypt..."
    cd $VERSION/src > /dev/null
    make NOGUI=1

    echo "Installing veracrypt..."
    sudo cp Main/veracrypt /usr/bin >> ~/.provision.log
fi

popd > /dev/null

echo "Completed veracrypt installation"
echo " "
