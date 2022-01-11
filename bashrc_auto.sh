#!/bin/bash

# Automating the deployment of a "fancy bashrc" file for all users
# Call this script with :
# eval "$(wget -qO- https://raw.githubusercontent.com/kina-mpo/debian/main/bashrc_auto.sh)"

# Deleting the ".bashrc" file into the "/etc/skel" directory :
rm -rf /etc/skel

# Deleting the "bash.bashrc" file into the "/etc" directory :
rm -f /etc/bash.bashrc

# Getting the new "bash.bashrc" file 
wget -qO /etc/bash.bashrc https://raw.githubusercontent.com/kina-mpo/debian/main/bash.bashrc
