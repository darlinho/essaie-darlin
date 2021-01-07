#!/bin/bash

echo "Forward file"

sudo cat <<EOF > /etc/bind/forward.$DOMAIN.db
;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	$HOST.$DOMAIN root.$DOMAIN. (
			      7		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	localhost.
@	IN	A	127.0.0.1
@	IN	AAAA	::1

;Name Server Information

@	IN	NS	$HOST.$DOMAIN.

;IP address of Name Server

$HOST	IN	A	$IPADDRESS

;Mail Exchanger

$DOMAIN.	IN	MX	10	mail.$DOMAIN.

;A - Record Hostname To Ip Adress

bbb        IN  A  192.168.33.216

;CNAME record

;ftp IN CNAME gate.$DOMAIN

EOF

sleep 5