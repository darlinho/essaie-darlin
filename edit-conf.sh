#!/bin/bash

WP_HOME=$HOME/wordpress/docker

################### For wordpress install ##############################

IREX_DOMAIN=dev.irex.aretex.ca
MYSQL_PASSWORD=w0rdpr355-d3V
WP_URL=wp.dev.irex.aretex.ca
WP_DOMAINS="wp.dev.irex.aretex.ca"


################### For step-ca configuration ###########################

##get the step server hostname
STEP_CA_HOST="step-ca.uat.irex.aretex.ca"

##get the step client server
STEP_CLIENT_NAME=$SERVER_NAME

##get the IP of step server
STEP_CA_IP="192.168.33.202"

#get the port for access to step-ca service, make sure it's the correct value with step-server
PORT_ACCESS=8443

##get the user who has installed step-ca server
STEP_CA_USER="debian"

##get the pass of user
STEP_CA_PASS_USER="debian"


sed -i "s/IREX_DOMAIN=.*/IREX_DOMAIN=$IREX_DOMAIN/g" $WP_HOME/conf.defaults

sed -i "s/MYSQL_PASSWORD=.*/IREX_DOMAIN=$IREX_DOMAIN/g" $WP_HOME/conf.defaults

sed -i "s/IREX_DOMAIN=.*/IREX_DOMAIN=$IREX_DOMAIN/g" $WP_HOME/conf.defaults

sed -i "s/IREX_DOMAIN=.*/IREX_DOMAIN=$IREX_DOMAIN/g" $WP_HOME/conf.defaults

sed -i "s/IREX_DOMAIN=.*/IREX_DOMAIN=$IREX_DOMAIN/g" $WP_HOME/conf.defaults

sed -i "s/IREX_DOMAIN=.*/IREX_DOMAIN=$IREX_DOMAIN/g" $WP_HOME/conf.defaults

sed -i "s/IREX_DOMAIN=.*/IREX_DOMAIN=$IREX_DOMAIN/g" $WP_HOME/conf.defaults

sed -i "s/IREX_DOMAIN=.*/IREX_DOMAIN=$IREX_DOMAIN/g" $WP_HOME/conf.defaults

sed -i "s/IREX_DOMAIN=.*/IREX_DOMAIN=$IREX_DOMAIN/g" $WP_HOME/conf.defaults

sed -i "s/IREX_DOMAIN=.*/IREX_DOMAIN=$IREX_DOMAIN/g" $WP_HOME/conf.defaults

