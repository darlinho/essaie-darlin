#!/bin/bash


#### Configure DNS to use static ip address

sudo apt-get -y install ifupdown resolvconf

sudo cat <<EOF > /etc/network/interfaces

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
dns-nameservers  8.8.8.8
# Search Domain
dns-search $DOMAIN                              
EOF

sudo service networking restart 
