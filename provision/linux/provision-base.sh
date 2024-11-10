#!/bin/bash

echo "------------------------------------------------------------------------"
echo " New device core provisioning script"
echo "------------------------------------------------------------------------"
echo " "

bash install/osupdate.sh
bash install/bash.sh
bash install/utilities.sh
bash install/git.sh
bash install/sshd.sh
bash install/xrdp.sh
bash install/python.sh
bash install/appframeworks.sh
bash install/apps.sh

echo "Completed core provisioning "
echo "------------------------------------------------------------------------"
