#!/bin/bash

echo "------------------------------------------------------------------------"
echo " New device provisioing script"
echo "------------------------------------------------------------------------"
echo " "

bash install/osupdate.sh
bash install/bash.sh
bash install/utilities.sh
bash install/sshd.sh
bash install/git.sh
bash install/python.sh
bash install/appframeworks.sh
bash install/apps.sh
bash install/veracrypt.sh
bash install/mullvad.sh
bash install/softlinks.sh
bash install/gnome.sh

echo "Completed device provisioing "
echo "------------------------------------------------------------------------"
