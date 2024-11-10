#!/bin/bash

echo "------------------------------------------------------------------------"
echo " OS updates"
echo "------------------------------------------------------------------------"

echo "Updating catalog"
sudo apt update >> ~/.provision.log 2>> ~/.provision.log

echo "Installing OS updates..."
sudo apt upgrade -y >> ~/.provision.log 2>> ~/.provision.log

echo "Completed OS updates "
echo " "

