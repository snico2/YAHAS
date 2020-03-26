#!/bin/bash

#----------------------------------------------------------------
# Title	        setupMosquitto.sh
# Version       0.1
# Date	        04-09-2019
# Author        Nicola Sellitto
# Scope	        MOSQUITTO setup procedure
#----------------------------------------------------------------

echo 
read -p "Start MOSQUITTO setup procedure: press any key to continue"


# --------------------------------------
# 0) Make work directory
# --------------------------------------
directory="/home/pi/YAHAS/mosquitto/"
if [ -d "$directory" ]
then
    echo
else
    mkdir $directory
fi
cd $directory


# --------------------------------------
# 1) Import repository package
# --------------------------------------
echo 
read -p "1) Import repository package: press any key to continue"
echo 
file="mosquitto-repo.gpg.key"
if [ -f "$file" ]; then
    sudo rm $file
fi
wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
sudo apt-key add mosquitto-repo.gpg.key


# --------------------------------------
# 2) Get repository
# --------------------------------------
echo 
read -p "2) Get repository: press any key to continue"
echo 
cd /etc/apt/sources.list.d/
file="mosquitto-buster.list"
if [ -f "$file" ]; then
    sudo rm $file
fi
sudo wget http://repo.mosquitto.org/debian/mosquitto-buster.list


# --------------------------------------
# 3) Check system update & upgrade
# --------------------------------------
echo 
read -p "3) Check system update & upgrade: press any key to continue"
echo 
sudo apt update
sudo apt upgrade -y


# --------------------------------------
# 4) Run installation process
# --------------------------------------
echo 
read -p "4) Exec install programm: press any key to continue"
echo 
sudo apt-get install mosquitto
sudo apt-get install mosquitto-clients


# --------------------------------------
# 5) Check service
# --------------------------------------
echo 
read -p "5) Check service: press any key to continue"
echo 
service mosquitto status
ps -ef | grep mosq
netstat -tln | grep 1883


echo 
echo "End MOSQUITTO setup procedure"


