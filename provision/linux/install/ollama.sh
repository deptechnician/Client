#!/bin/bash

echo "------------------------------------------------------------------------"
echo " Install ollama"
echo "------------------------------------------------------------------------"


if command -v ollama > /dev/null
then
    echo "Ollama is already installed"
else
    echo "Installing Ollama"
    curl -fsSL https://ollama.com/install.sh | sh >> ~/.provision.log
    ollama pull phi3 >> ~/.provision.log
    ollama pull tinyllama >> ~/.provision.log
fi

echo "Completed Ollama installation"
echo " "
