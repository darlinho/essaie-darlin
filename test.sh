#!/bin/bash

name=$(echo $1 | cut -f1 -d'.')
temp=$(awk "/$name/ {print}" forward.dev.irex.aretex.ca.db | head -n1 | awk '{print $4}')


if [[ $temp = "" ]]
then
	echo "Ce nom n'existe pas il vas etre renseigne"
else
	sed "s/$temp/$2/g" forward.dev.irex.aretex.ca.db
	echo "succefull modify"
fi

