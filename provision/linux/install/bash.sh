#!/bin/bash

echo "------------------------------------------------------------------------"
echo " Bash configuration"
echo "------------------------------------------------------------------------"

cp ~/Code/setup/.bash_aliases ~
source ~/.bashrc

echo "Completed bash configuration "
echo " "

bash install/helper-apt.sh highlight highlight "highlight"
