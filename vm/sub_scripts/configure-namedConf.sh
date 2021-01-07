#!/bin/bash

echo "Create nam.conf"

sudo cat <<EOF > /etc/bind/named.conf.local
//
// Do any local configuration here
//

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";


zone "${DOMAIN}" IN {

	type master;
	file "/etc/bind/forward.$DOMAIN.db";
	//allow-update { none; };
	allow-transfer { $DNSIP; 8.8.8.8; };
};


zone "dev.irex.aretex.ca" IN {

	type master;
	file "/etc/bind/forward.$DOMAIN.db";
	//allow-update { none; };
	allow-transfer { $DNSIP; 8.8.8.8; };
};


zone "33.168.192.in-addr.arpa" IN {

	type master;
	file "/etc/bind/reverse.$DOMAIN.db";
	//allow-update { none;};
	allow-transfer { 8.8.8.8; };
};
EOF

sleep 5