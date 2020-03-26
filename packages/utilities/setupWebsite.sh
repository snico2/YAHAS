#!/bin/bash

#----------------------------------------------------------------
# Title	        setupWebsite.sh
# Version       0.1
# Date	        04-09-2019
# Author        Nicola Sellitto
# Scope	        WEBSITE  setup procedure
#----------------------------------------------------------------


echo 
read -p "Start WEBSITE setup procedure: press any key to continue"

# File extract
tar -xvf website.tar.gz -C /var/www/html


echo 
echo "End WEBSITE setup procedure"
