#!/bin/bash

WP_HOME=$HOME/wordpress/docker


sed -i "s/IREX_DOMAIN=.*/IREX_DOMAIN=$IREX_DOMAIN/g" $WP_HOME/conf.defaults

sed -i "s/MYSQL_PASSWORD=.*/MYSQL_PASSWORD=$MYSQL_PASSWORD/g" $WP_HOME/conf.defaults

sed -i "s/WP_URL=.*/WP_URL=$WP_URL/g" $WP_HOME/conf.defaults

sed -i "s/WP_DOMAINS=.*/WP_DOMAINS=$WP_DOMAINS/g" $WP_HOME/conf.defaults

sed -i "s/STEP_CA_HOST=.*/STEP_CA_HOST=$STEP_CA_HOST/g" $WP_HOME/conf.defaults

sed -i "s/STEP_CLIENT_NAME=.*/STEP_CLIENT_NAME=$STEP_CLIENT_NAME/g" $WP_HOME/conf.defaults

sed -i "s/STEP_CA_IP=.*/STEP_CA_IP=$STEP_CA_IP/g" $WP_HOME/conf.defaults

sed -i "s/PORT_ACCESS=.*/PORT_ACCESS=$PORT_ACCESS/g" $WP_HOME/conf.defaults

sed -i "s/STEP_CA_USER=.*/STEP_CA_USER=$STEP_CA_USER/g" $WP_HOME/conf.defaults

sed -i "s/STEP_CA_PASS_USER=.*/STEP_CA_PASS_USER=$STEP_CA_PASS_USER/g" $WP_HOME/conf.defaults

