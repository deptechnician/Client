#!/bin/bash

echo "------------------------------------------------------------------------"
echo " Softlinks"
echo "------------------------------------------------------------------------"

# Make the Documents folder be a symbolic link into the Nextcloud folder
#
pushd . > /dev/null
cd ~

if [[ -h ~/Documents ]]; then
    echo "Documents is already a symbolic link"
else
    echo "Creating the symbolic link for ~/Documents"
    rmdir ~/Documents 2> /dev/null
    ln -s ~/Nextcloud/Documents ~/Documents
fi

if [[ -h ~/Content ]]; then
    echo "Content is already a symbolic link"
else
    echo "Creating the symbolic link for ~/Content"
    rmdir ~/Content 2> /dev/null
    ln -s ~/Nextcloud/Content ~/Content
fi

if [[ -h ~/Private ]]; then
    echo "Private is already a symbolic link"
else
    echo "Creating the symbolic link for ~/Private"
    ln -s /media/veracrypt1 ~/Private
fi

if [[ -h ~/Credentials ]]; then
    echo "Credentials is already a symbolic link"
else
    echo "Creating the symbolic link for ~/Credentials"
    ln -s /media/veracrypt3 ~/Credentials
fi

popd > /dev/null

echo "Completed softlink configuration"
echo " "

