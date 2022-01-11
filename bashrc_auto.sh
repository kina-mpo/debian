#!/bin/bash

# Automating the deployment of a "fancy bashrc" file for all users
# Call this script with :
# eval "$(wget -qO- https://raw.githubusercontent.com/kina-mpo/debian/main/bashrc_auto.sh)"

# Starting by getting all variables and functions
eval "$(wget -qO- https://raw.githubusercontent.com/kina-mpo/variables/main/auto.sh)"
eval "$(wget -qO- https://raw.githubusercontent.com/kina-mpo/functions/main/auto.sh)"

# Locking the script
lock

# Deleting the ".bashrc" file into the "/etc/skel" directory :
rm -f /etc/skel/.bashrc

# Deleting the "bash.bashrc" file into the "/etc" directory :
rm -f /etc/bash.bashrc

# Getting the new "bash.bashrc" file 

# Unlocking the script
unlock
