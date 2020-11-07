#!/bin/bash 

# Check if running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

## Preparing all the variables like IP, Hostname, etc, all of them from the server

RANDOMHAM=$(date +%s|sha256sum|base64|head -c 10)
RANDOMSPAM=$(date +%s|sha256sum|base64|head -c 10)
RANDOMVIRUS=$(date +%s|sha256sum|base64|head -c 10)

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

cat <<EOF > /etc/hosts
127.0.0.1	localhost
$CONTAINERIP	$HOSTNAME.$DOMAIN	$HOSTNAME
::1	localhost ip6-localhost ip6-loopback
#fe00::0	ip6-localnet
#ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF


##Preparing the config files to inject
echo "Creating the Scripts files"
mkdir /tmp/zcs && cd /tmp/zcs

touch /tmp/zcs/installZimbraScript
cat <<EOF >/tmp/zcs/installZimbraScript
AVDOMAIN="$DOMAIN"
AVUSER="admin@$DOMAIN"
CREATEADMIN="admin@$DOMAIN"
CREATEADMINPASS="$PASS"
CREATEDOMAIN="$DOMAIN"
DOCREATEADMIN="yes"
DOCREATEDOMAIN="yes"
DOTRAINSA="yes"
EXPANDMENU="no"
HOSTNAME="$HOSTNAME.$DOMAIN"
HTTPPORT="8080"
HTTPPROXY="TRUE"
HTTPPROXYPORT="80"
HTTPSPORT="8443"
HTTPSPROXYPORT="443"
IMAPPORT="7143"
IMAPPROXYPORT="143"
IMAPSSLPORT="7993"
IMAPSSLPROXYPORT="993"
INSTALL_WEBAPPS="service zimlet zimbra zimbraAdmin"
JAVAHOME="/opt/zimbra/common/lib/jvm/java"
LDAPAMAVISPASS="$PASS"
LDAPPOSTPASS="$PASS"
LDAPROOTPASS="$PASS"
LDAPADMINPASS="$PASS"
LDAPREPPASS="$PASS"
LDAPBESSEARCHSET="set"
LDAPDEFAULTSLOADED="1"
LDAPHOST="$HOSTNAME.$DOMAIN"
LDAPPORT="389"
LDAPREPLICATIONTYPE="master"
LDAPSERVERID="2"
MAILBOXDMEMORY="512"
MAILPROXY="TRUE"
MODE="https"
MYSQLMEMORYPERCENT="30"
POPPORT="7110"
POPPROXYPORT="110"
POPSSLPORT="7995"
POPSSLPROXYPORT="995"
PROXYMODE="https"
REMOVE="no"
RUNARCHIVING="no"
RUNAV="yes"
RUNCBPOLICYD="no"
RUNDKIM="yes"
RUNSA="yes"
RUNVMHA="no"
SERVICEWEBAPP="yes"
SMTPDEST="admin@$DOMAIN"
SMTPHOST="$HOSTNAME.$DOMAIN"
SMTPNOTIFY="yes"
SMTPSOURCE="admin@$DOMAIN"
SNMPNOTIFY="yes"
SNMPTRAPHOST="$HOSTNAME.$DOMAIN"
SPELLURL="http://$HOSTNAME.$DOMAIN:7780/aspell.php"
STARTSERVERS="yes"
SYSTEMMEMORY="3.8"
TRAINSAHAM="ham.$RANDOMHAM@$DOMAIN"
TRAINSASPAM="spam.$RANDOMSPAM@$DOMAIN"
UIWEBAPPS="yes"
UPGRADE="yes"
USEKBSHORTCUTS="TRUE"
USESPELL="yes"
VERSIONUPDATECHECKS="TRUE"
VIRUSQUARANTINE="virus-quarantine.$RANDOMVIRUS@$DOMAIN"
ZIMBRA_REQ_SECURITY="yes"
ldap_bes_searcher_password="$PASS"
ldap_dit_base_dn_config="cn=zimbra"
ldap_nginx_password="$PASS"
ldap_url="ldap://$HOSTNAME.$DOMAIN:389"
mailboxd_directory="/opt/zimbra/mailboxd"
mailboxd_keystore="/opt/zimbra/mailboxd/etc/keystore"
mailboxd_keystore_password="$PASS"
mailboxd_server="jetty"
mailboxd_truststore="/opt/zimbra/common/lib/jvm/java/jre/lib/security/cacerts"
mailboxd_truststore_password="changeit"
postfix_mail_owner="postfix"
postfix_setgid_group="postdrop"
ssl_default_digest="sha256"
zimbraDNSMasterIP=""
zimbraDNSTCPUpstream="no"
zimbraDNSUseTCP="yes"
zimbraDNSUseUDP="yes"
zimbraDefaultDomainName="$DOMAIN"
zimbraFeatureBriefcasesEnabled="Enabled"
zimbraFeatureTasksEnabled="Enabled"
zimbraIPMode="ipv4"
zimbraMailProxy="FALSE"
zimbraMtaMyNetworks="127.0.0.0/8 $CONTAINERIP/32 [::1]/128 [fe80::]/64"
zimbraPrefTimeZoneId="America/Los_Angeles"
zimbraReverseProxyLookupTarget="TRUE"
zimbraVersionCheckInterval="1d"
zimbraVersionCheckNotificationEmail="admin@$DOMAIN"
zimbraVersionCheckNotificationEmailFrom="admin@$DOMAIN"
zimbraVersionCheckSendNotifications="TRUE"
zimbraWebProxy="FALSE"
zimbra_ldap_userdn="uid=zimbra,cn=admins,cn=zimbra"
zimbra_require_interprocess_security="1"
zimbra_server_hostname="$HOSTNAME.$DOMAIN"
INSTALL_PACKAGES="zimbra-core zimbra-ldap zimbra-logger zimbra-mta zimbra-snmp zimbra-store zimbra-apache zimbra-spell zimbra-memcached zimbra-proxy"
EOF

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

## Install Zimbra Mail Server

if [[ `lsb_release -rs` == "18.04" ]]; then
	echo "Downloading Zimbra Collaboration 8.8.10 for Ubuntu 18.04"
	wget https://files.zimbra.com/downloads/${VERSION}_GA/zcs-${VERSION}_GA_3869.UBUNTU18_64.20190918004220.tgz
	tar xzvf zcs-*
	echo "Installing Zimbra Collaboration just the Software"
	cd /tmp/zcs/zcs-* && ./install.sh -s < /tmp/zcs/installZimbra-keystrokes
	echo "Installing Zimbra Collaboration injecting the configuration"
	/opt/zimbra/libexec/zmsetup.pl -c /tmp/zcs/installZimbraScript
fi

if [[ `lsb_release -rs` == "16.04" ]]; then
	echo "Downloading Zimbra Collaboration 8.8.10 for Ubuntu 16.04"
	wget https://files.zimbra.com/downloads/8.8.10_GA/zcs-8.8.10_GA_3039.UBUNTU16_64.20180928094617.tgz
	tar xzvf zcs-*
	echo "Installing Zimbra Collaboration just the Software"
	cd /tmp/zcs/zcs-* && ./install.sh -s < /tmp/zcs/installZimbra-keystrokes
	echo "Installing Zimbra Collaboration injecting the configuration"
	/opt/zimbra/libexec/zmsetup.pl -c /tmp/zcs/installZimbraScript
fi
if [[ `lsb_release -rs` == "14.04" ]]; then
	echo "Downloading Zimbra Collaboration 8.8.10 for Ubuntu 14.04"
	wget https://files.zimbra.com/downloads/8.8.10_GA/zcs-8.8.10_GA_3039.UBUNTU14_64.20180928094617.tgz
	tar xzvf zcs-*
	echo "Installing Zimbra Collaboration just the Software"
	cd /tmp/zcs/zcs-* && ./install.sh -s < /tmp/zcs/installZimbra-keystrokes
	echo "Installing Zimbra Collaboration injecting the configuration"
	/opt/zimbra/libexec/zmsetup.pl -c /tmp/zcs/installZimbraScript
fi

## Add Crontab for server autostart at startup or reboot 
cat <(crontab -l) <(echo "@reboot su - zimbra -c 'zmcontrol start'") | crontab -

echo "You can access now to your Zimbra Collaboration Server"
echo "Admin Console: https://"$CONTAINERIP":7071"
echo "Web Client: https://"$CONTAINERIP
