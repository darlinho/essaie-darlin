#!/bin/bash


BuildHelp()
{
	# Display Help
	echo "Add description of the script functions here."
	echo
	echo "options:"
	echo "-h     Print this help."
	echo "-i     To install DNS Server"
	echo
}

Installation(){
 
#### Variables

source conf/conf.defaults

IPADDRESS=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
DOMAIN=$(hostname -d)
HOSTNAME=$(hostname)
HOST=$(hostname -s)

#### Update repository index

sudo apt update

#### Configure DNS to use static ip address

source sub_scripts/configure-static-ip.sh

#### Install DNS and configure DNS

#install DNS
sudo apt install -y bind9 bind9utils bind9-doc dnsutils


# Configure dns server

source sub_scripts/configure-namedConf.sh
source sub_scripts/configure-forward.sh
source sub_scripts/configure-reverse.sh

sudo systemd-resolve --flush-caches
sudo systemctl restart bind9
sudo systemctl enable bind9
sudo systemctl restart systemd-resolved.service systemd-networkd.service

sudo rndc reload $DOMAIN
sudo rndc reload 33.168.192.in-addr.arpa

sudo sed -i -e "s/^\(search\).*$/& $DOMAIN/g" /etc/resolv.conf 
#sudo sed -i "5s/.*/nameserver 192.168.33.83/g" /etc/resolv.conf 

}







addLines()
{

echo "addLines work"

}

ParseOpts()
{
# Get the options
while getopts "install:add:help" option; do
   case $option in
      h) # display build.sh help
         BuildHelp
         exit;;
      i)
         Installation
         exit;;
      a)
         addLines
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









