#!/bin/bash

#----------------------------------------------------------------
# Title	        setupSSL.sh
# Version       0.1
# Date	        04-09-2019
# Author        Nicola Sellitto
# Scope	        SSL setup procedure
#----------------------------------------------------------------


echo 
read -p "Start SSL setup procedure: press any key to continue"


# --------------------------------------
# 1) Check system update & upgrade
# --------------------------------------
echo 
read -p "1) Check system update & upgrade: press any key to continue"
echo 
sudo apt update
sudo apt upgrade -y



# --------------------------------------
# 2) Run installation process
# --------------------------------------
echo 
read -p "2) Run installation programm: press any key to continue"
echo 
sudo apt-get install openssl -y




echo 
echo "End SSL setup procedure"


