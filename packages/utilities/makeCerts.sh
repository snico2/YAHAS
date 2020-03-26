#!/bin/bash

#----------------------------------------------------------------
# Title	        makeCerts.sh
# Version       0.1
# Date	        04-09-2019
# Author        Nicola Sellitto
# Scope	        CERTS setup procedure
#----------------------------------------------------------------


echo 
read -p "Start CERTS setup procedure: press any key to continue"


# --------------------------------------
# Make work directory
# --------------------------------------
directory="/home/pi/YAHAS/certs/"
if [ -d "$directory" ]
then
    echo
else
    mkdir $directory
fi
cd $directory



# --------------------------------------
# Set CA's name & Server's name
# --------------------------------------
echo 
read -p "Enter CA's name:"  caName
echo 
read -p "Enter server's name:"  srvName
echo 

srvName=$(hostname)
caName=$(hostname)_ca

echo "srvName: " $srvName
echo "caName : " $caName

# --------------------------------------
# 1) Create CA's RSA key 
# --------------------------------------
echo 
read -p "1) Create CA's RSA key: press any key to continue"
echo 
sudo openssl genrsa -des3 -out $caName.key 2048


# --------------------------------------
# 2) Create CA's certificate
# --------------------------------------
echo 
read -p "2) Create CA's certificate: press any key to continue"
echo 
sudo openssl req -new -x509 -days 3650 -key $caName.key -out $caName.crt



# --------------------------------------
# 3) Create server's RSA key 
# --------------------------------------
echo 
read -p "3) Create server's RSA key: press any key to continue"
echo 
sudo openssl genrsa -out $srvName.key 2048


# --------------------------------------
# 4) Create server's certificate request
# --------------------------------------
echo 
read -p "4) Create server's certificate request: press any key to continue"
echo 
sudo openssl req -new -out $srvName.csr -key $srvName.key


# --------------------------------------
# 5) Verify and Sign server's certificate
# --------------------------------------
echo 
read -p "5) Verify and Sign server's certificate snicoweb.csr: press any key to continue"
echo 
sudo openssl x509 -req -in $srvName.csr -CA $caName.crt -CAkey $caName.key -CAcreateserial -out $srvName.crt -days 3650


# --------------------------------------
# 6) Copy files
# --------------------------------------
echo 
read -p "6) Copy files: press any key to continue"
echo 
sudo cp $caName.crt   /etc/ssl/certs
sudo cp $srvName.crt  /etc/ssl/certs
sudo cp $srvName.key  /etc/ssl/private




echo 
echo "End CERTS setup procedure"


