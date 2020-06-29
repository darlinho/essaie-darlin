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
 

IPADDRESS=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
GATEWAYIP="192.168.33.1"
DNSIP="192.168.33.1"
DOMAIN="dev.irex.aretex.ca"

#### Update repository index

sudo apt update

#### Configure DNS to use static ip address

sudo apt-get -y install ifupdown resolvconf

sudo cat <<EOF >/etc/network/interfaces

# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static
# Adresse IP
address $IPADDRESS
# Netmask
netmask 255.255.255.0
# Gateway
gateway $GATEWAYIP
# DNS Servers
dns-nameservers $DNSIP
dns-nameservers 8.8.8.8
# Search Domain
dns-search $DOMAIN                              
EOF

sudo service networking restart

#### Install DNS and configure DNS

#install DNS
sudo apt install -y bind9 bind9utils bind9-doc dnsutils



}

ParseOpts()
{
# Get the options
while getopts "in:h" option; do
case$optionin
	h)# display build.sh help
BuildHelp
exit;;
i)
Installation
exit;;
\?)# incorrect option
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
if [$#!=0]
then
	ParseOpts "${@:1}";
fi
SetMissingOpts;








#### Variables

IPADDRESS=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
GATEWAYIP="192.168.33.1"
DNSIP="192.168.33.1"
DOMAIN="dev.irex.aretex.ca"

#### Update repository index

sudo apt update

#### Configure DNS to use static ip address

sudo apt-get -y install ifupdown resolvconf

sudo cat <<EOF >/etc/network/interfaces

# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static
# Adresse IP
address $IPADDRESS
# Netmask
netmask 255.255.255.0
# Gateway
gateway $GATEWAYIP
# DNS Servers
dns-nameservers $DNSIP
dns-nameservers 8.8.8.8
# Search Domain
dns-search $DOMAIN                              
EOF

sudo service networking restart 

#### Install DNS and configure DNS

#install DNS
sudo apt install -y bind9 bind9utils bind9-doc dnsutils

# Configure dns server

sudo cp conf/named.conf.local /etc/bind/
sudo cp conf/forward.dev.irex.aretex.ca.db /etc/bind/
sudo cp conf/reverse.dev.irex.aretex.ca.db /etc/bind/

sudo systemctl restart bind9
sudo systemctl enable bind9

sudo rndc reload dev.irex.aretex.ca
sudo rndc reload 33.168.192.in-addr.arpa

sudo sed -i -e "s/^\(search\).*$/& dev.irex.aretex.ca/g" /etc/resolv.conf 
sudo sed -i "5s/.*/nameserver 192.168.33.83/g" /etc/resolv.conf 
