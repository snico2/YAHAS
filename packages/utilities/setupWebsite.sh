#!/bin/bash

#----------------------------------------------------------------
# Title	        setupWebsite.sh
# Version       0.2
# Date	        27-02-2020
# Author        Nicola Sellitto
# Scope	        WEBSITE  setup procedure
#----------------------------------------------------------------


echo 
read -p "Start WEBSITE setup procedure: press any key to continue"

# File extract
tar -xvf website.tar.gz -C /var/www/html

sudo chown pi:www-data /var/www/html/data/*.json
sudo chmod 660 /var/www/html/data/*.json

echo 
echo "End WEBSITE setup procedure"
