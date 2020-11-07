#!/bin/bash 

# Check if running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


## Preparing all the variables like IP, Hostname, etc, all of them from the server


CONF_DIR=~/zimbra/vm/conf
source $CONF_DIR/conf.defaults

if [[ -z "$CONTAINERIP" ]];then
	CONTAINERIP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/')
fi

if [[ -z "$HOSTNAME" ]];then
	HOSTNAME=$(hostname -s)
fi

if [[ -z "$DOMAIN" ]];then
	DOMAIN=$(hostname -d)
fi

if [[-z "$PASS"]];then
	PASS="irex-zimbra"
fi

if [[-z "$VERSION"]];then
	VERSION="8.8.15"
fi


################ Prepared zimbra configuration for the installation #########################

./$CONF_DIR/configuration-script.sh

############################## Install Zimbra Mail Server ###################################



# Installation for ubuntu 18.04
if [[ `lsb_release -rs` == "18.04" ]]; then

	echo "####################################################################################"
	echo "|                Beginning installation of zimbra on ubuntu 18.04                  |"
	echo "####################################################################################"

	echo "Downloading Zimbra Collaboration " ${VERSION} " for Ubuntu 18.04"
	wget https://files.zimbra.com/downloads/${VERSION}_GA/zcs-${VERSION}_GA_3869.UBUNTU18_64.20190918004220.tgz
	tar xzvf zcs-*
	echo "Installing Zimbra Collaboration just the Software"
	cd /tmp/zcs/zcs-* && ./install.sh -s < $CONF_DIR/installZimbra-keystrokes
	echo "Installing Zimbra Collaboration injecting the configuration"
	/opt/zimbra/libexec/zmsetup.pl -c /tmp/zcs/installZimbraScript
fi

# Installation for ubuntu 16.04
if [[ `lsb_release -rs` == "16.04" ]]; then
	echo "Downloading Zimbra Collaboration " ${VERSION} " for Ubuntu 16.04"
	wget https://files.zimbra.com/downloads/${VERSION}_GA/zcs-${VERSION}_GA_3869.UBUNTU16_64.20190918004220.tgz
	tar xzvf zcs-*
	echo "Installing Zimbra Collaboration just the Software"
	cd /tmp/zcs/zcs-* && ./install.sh -s < $CONF_DIR/installZimbra-keystrokes
	echo "Installing Zimbra Collaboration injecting the configuration"
	/opt/zimbra/libexec/zmsetup.pl -c /tmp/zcs/installZimbraScript
fi

# Installation for ubuntu 14.04
if [[ `lsb_release -rs` == "14.04" ]]; then
	echo "Downloading Zimbra Collaboration " ${VERSION} " for Ubuntu 14.04"
	wget https://files.zimbra.com/downloads/${VERSION}_GA/zcs-${VERSION}_GA_3869.UBUNTU14_64.20190918004220.tgz
	tar xzvf zcs-*
	echo "Installing Zimbra Collaboration just the Software"
	cd /tmp/zcs/zcs-* && ./install.sh -s < $CONF_DIR/installZimbra-keystrokes
	echo "Installing Zimbra Collaboration injecting the configuration"
	/opt/zimbra/libexec/zmsetup.pl -c /tmp/zcs/installZimbraScript
fi

## Add Crontab for server autostart at startup or reboot 
cat <(crontab -l) <(echo "@reboot su - zimbra -c 'zmcontrol start'") | crontab -

echo "You can access now to your Zimbra Collaboration Server"
echo "Admin Console: https://"$CONTAINERIP":7071"
echo "Web Client: https://"$CONTAINERIP
