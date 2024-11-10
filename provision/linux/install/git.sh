#!/bin/bash

echo "------------------------------------------------------------------------"
echo " Git configuration"
echo "------------------------------------------------------------------------"

if [[ -f ~/.ssh/depgithub ]]; then
    echo "Git is already provisioned"
else
    git config --global user.name DepTech
    git config --global user.email technician@dep
    ssh-keygen -t ed25519 -C "depgithub" -f ~/.ssh/depgithub
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/depgithub
fi

echo "Add this key to your github account:"
cat ~/.ssh/depgithub.pub

echo "Completed git configuration"
echo " "


