#!/bin/bash

##################### Variables ##################################

name=$(echo $1 | cut -f1 -d'.')
lastOip=$(echo $2 | cut -f4 -d'.')

tempip=$(awk "/$name/ {print}" /etc/bind/forward.dev.irex.aretex.ca.db | head -n1 | awk '{print $4}')
lastOctectReverse=$(awk "/$name.dev.irex.aretex.ca/ {print}" /etc/bind/reverse.dev.irex.aretex.ca.db | head -n1 | awk '{print $1}')

nbreDeLigne=$(wc -l</etc/bind/forward.dev.irex.aretex.ca.db)
ligneVide=$(($nbreDeLigne - 6))

##################### Variables ##################################

if [[ $tempip = "" && $lastOctectReverse = "" ]]
then
	echo "Nouvel Enregistrement ....."	
	sudo sed -i "$ligneVide a $name	   IN  A  $2" /etc/bind/forward.dev.irex.aretex.ca.db
	sudo sed -i "$ a $lastOip	IN	PTR	$name.dev.irex.aretex.ca." /etc/bind/reverse.dev.irex.aretex.ca.db
	sudo rndc reload dev.irex.aretex.ca
	sudo rndc reload 33.168.192.in-addr.arpa
	
	echo "done."

else
	echo "Modification de l'enregistrement ....."
	sed -i "s/$tempip/$2/g" /etc/bind/forward.dev.irex.aretex.ca.db
	sed -i "s/$lastOctectReverse/$lastOip/g" /etc/bind/reverse.dev.irex.aretex.ca.db
	sudo rndc reload dev.irex.aretex.ca
	sudo rndc reload 33.168.192.in-addr.arpa
	echo "succefull modify."
	
fi

