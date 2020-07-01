#!/bin/bash

name=$(echo $1 | cut -f1 -d'.')
lastOip=$(echo $2 | cut -f4 -d'.')


tempip=$(awk "/$name/ {print}" forward.dev.irex.aretex.ca.db | head -n1 | awk '{print $4}')
lastOctectReverse=$(awk "/$name.dev.irex.aretex.ca/ {print}" reverse.dev.irex.aretex.ca.db | head -n1 | awk '{print $1}')

echo $lastOctectReverse

nbreDeLigne=$(wc -l<forward.dev.irex.aretex.ca.db)
ligneVide=$(($nbreDeLigne - 6))

if [[ $tempip = "" && $lastOctectReverse = "" ]]
then
	echo "Nouvel Enregistrement ....."	
	sudo sed -i "$ligneVide a $name	   IN  A  $2" forward.dev.irex.aretex.ca.db
	sudo sed -i "$ a $lastOip	IN	PTR	$name.dev.irex.aretex.ca" reverse.dev.irex.aretex.ca.db
	sudo rndc reload dev.irex.aretex.ca
	sudo rndc reload 33.168.192.in-addr.arpa
	
	echo "done."

else
	echo "Modification de l'enregistrement ....."
	sed -i "s/$tempip/$2/g" forward.dev.irex.aretex.ca.db
	sed -i "s/$lastOctectReverse/$lastOip/g" reverse.dev.irex.aretex.ca.db
	sudo rndc reload dev.irex.aretex.ca
	sudo rndc reload 33.168.192.in-addr.arpa
	echo "succefull modify."
	
fi

