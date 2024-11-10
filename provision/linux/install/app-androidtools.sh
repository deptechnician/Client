#!/bin/bash

echo "------------------------------------------------------------------------"
echo " App installation"
echo "------------------------------------------------------------------------"

bash install/helper-apt.sh adb "Android Debug Bridge"
bash install/helper-apt.sh android-tools-adb "Android Debugging Tools"
