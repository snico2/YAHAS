#!/bin/bash

#----------------------------------------------------------------
# Title	        setupApache.sh
# Version       0.1
# Date	        04-09-2019
# Author        Nicola Sellitto
# Scope	        APACHE setup procedure
#----------------------------------------------------------------


echo 
read -p "Start APACHE setup procedure: press any key to continue"


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
sudo apt install apache2


# --------------------------------------
# 3) Set file attribute
# --------------------------------------
echo 
read -p "3) Set file attribute: press any key to continue"
echo 
sudo chown -R pi:www-data /var/www/html/
sudo chmod -R 770 /var/www/html/
sudo chown -R pi:www-data /var/www/html/


echo 
echo "End APACHE setup procedure"


