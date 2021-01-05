#!/bin/bash

sudo cat <<EOF > /etc/bind/reverse.$DOMAIN.db
;
; BIND reverse data file for local loopback interface
;
$TTL	604800
@	IN	SOA	$DOMAIN. root.$DOMAIN. (
			      3		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	localhost.
1.0.0	IN	PTR	localhost.

;Name server information

@	IN	NS	$HOSTNAME.

;Reverse lookup for Name server

10	IN	PTR	$HOSTNAME.

;PTR Record ip address to hostname

216	IN	PTR	bbb.dev.irex.aretex.ca.


EOF