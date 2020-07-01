#!/bin/bash

nbreDeLigne=$(wc -l</etc/bind/forward.dev.irex.aretex.ca.db)
ligneVide=$(($nbreDeLigne - 6))
ip="192.168.33.241"
ipl= $(($ip)=~/(\d+)$/)

sudo sed -i "$ligneVide a drive	   IN  A  192.168.33.241" /etc/bind/forward.dev.irex.aretex.ca.db
sudo sed -i "$ a $1IN  A  192.168.33.241" /etc/bind/reverse.dev.irex.aretex.ca.db
