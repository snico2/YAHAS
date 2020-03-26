#!/bin/bash
# install procedure

#----------------------------------------------------------------
# Title	        setupYManager.sh
# Version       0.2
# Date	        26-03-2020
# Author        Nicola Sellitto
# Scope	        YMANAGER setup procedure
#----------------------------------------------------------------


echo 
read -p "Start YMANAGER setup procedure: press any key to continue"


# --------------------------------------
# 1) Stop previous service
# --------------------------------------
echo 
read -p "1) Stop YMANAGER service: press any key to continue"
echo 
sudo systemctl stop ymanager.service


# --------------------------------------
# 2) Remove previous files
# --------------------------------------
echo 
read -p "2) Remove previous data file: press any key to continue"
echo 
directory="/opt/YManager"
if [ -d "$directory" ]; then
    sudo rm -r /opt/YManager
fi


# --------------------------------------
# 3) Extract news files
# --------------------------------------
echo 
read -p "3) Extract new data file: press any key to continue"
echo 
sudo tar -xvf ymanager.tar.gz -C /opt


# --------------------------------------
# Set file attribute
# --------------------------------------
sudo chown pi:pi /opt/YManager/ -R
sudo chmod +x /opt/YManager/ymanager.sh


# --------------------------------------
# 4) Create service
# --------------------------------------
echo 
read -p "4) Create service: press any key to continue"
echo 
sudo cp /opt/YManager/ymanager.service /lib/systemd/system/


# --------------------------------------
# Enable service
# --------------------------------------
sudo systemctl daemon-reload
sudo systemctl enable ymanager.service



echo 
echo "End YMANAGER setup procedure"
