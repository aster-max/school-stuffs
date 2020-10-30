#!/bin/bash
# wait     : sudo apt-get update & > sudo apt-get upgrade & > sudo apt-get install package
#          : wait $!
echo -e "---\\nUpdating packages ...\\n---"
apt-get update &
echo -e "---\\nInstalling packages ...\\n---"
apt-get install vim
echo -e "---\\nDone, Installation Successfully"

