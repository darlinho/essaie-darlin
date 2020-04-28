#!/bin/bash
# Check if running as root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

HOSTNAME=$(hostname -s)

echo $HOSTNAME

echo "Installation of bind9"
sudo apt-get install bind9 bind9utils

echo "configuring bind9 ..."

cat <<EOF >>/etc/bind/named.conf.options
options {
directory "/var/cache/bind";
forwarders {
8.8.8.8;
8.8.4.4;
};

dnssec-validation auto;

auth-nxdomain no; # conform to RFC1035
#listen-on-v6 { any; };
};
EOF

cat <<EOF >>/etc/bind/named.conf.local
zone "127.0.0.1" {
        type master;
        file "/etc/bind/db.0.0.127";
};
EOF

sudo service bind9 restart

echo "fermeture du firewail"

sudo service iptable stop 

touch /tmp/zcs/installZimbra-keystrokes
cat <<EOF >/tmp/zcs/installZimbra-keystrokes
y
y
y
y
y
n
y
y
y
y
y
y
y
n
y
y
EOF

echo "Download zimbra"
wget https://files.zimbra.com/downloads/8.7.0_GA/zcs-8.7.0_GA_1659.UBUNTU16_64.20160628202554.tgz

echo "Extracting file ..."

tar xf zcs-8.7.0_GA_1659.UBUNTU16_64.20160628202554.tgz

cd zcs-8.7.0_GA_1659.UBUNTU16_64.20160628202554

echo "Installation initialise ..."

sudo ./install.sh -s < /tmp/zcs/installZimbra-keystrokes

