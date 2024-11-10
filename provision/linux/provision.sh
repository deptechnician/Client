#!/bin/bash

echo "------------------------------------------------------------------------"
echo " Master provisioing script" 
echo "------------------------------------------------------------------------"
echo " "

if [[ -f ~/.provision.log ]]
then 
    rm ~/.provision.log
fi

bash provsion-device.sh
bash provision-ai.sh

echo "Completed master provisioing script "
echo "------------------------------------------------------------------------"
