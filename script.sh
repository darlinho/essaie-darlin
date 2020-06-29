#!/bin/bash

BuildHelp()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "options:"
   echo "-h     Print this help."
   echo "-i     Specify the list of folder images."
   echo
}

Installation(){
 sudo apt update
}


ParseOpts()
{
# Get the options
while getopts "in:h" option; do
   case $option in
      h) # display build.sh help
         BuildHelp
         exit;;
      i)
         Installation
         exit;;
     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done

}

SetMissingOpts()
{
	echo "Missing argument please run the with -h for help"
}



# 4) call function in your main
if [ $# != 0 ]
then
   ParseOpts "${@:1}";
fi
SetMissingOpts;

