#!/bin/bash

# You must first download openLDAP with wget

wget ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-2.4.47.tgz

# Extract this file and enter to the folder create

tar zxvf openldap-2.4.47.tgz
cd openldap-2.4.47

### Installation of OpenLDAP

patch -Np1 -i ../openldap-2.4.47-consolidated-1.patch &&
autoconf &&

./configure --prefix=/usr     \
            --sysconfdir=/etc \
            --disable-static  \
            --enable-dynamic  \
            --disable-debug   \
            --disable-slapd &&

make depend &&
make

# Then, as root user :
sudo make install
sudo ln -sf ../lib/slapd /usr/sbin/slapd

# There should be a dedicated user and group to take control of the slapd daemon after it is started

sudo groupadd -g 83 ldap &&
sudo useradd  -c "OpenLDAP Daemon Owner" \
         -d /var/lib/openldap -u 83 \
         -g ldap -s /bin/false ldap

# Install OpenLDAP by running the following commands:

patch -Np1 -i ../openldap-2.4.47-consolidated-1.patch &&
autoconf &&

./configure --prefix=/usr         \
            --sysconfdir=/etc     \
            --localstatedir=/var  \
            --libexecdir=/usr/lib \
            --disable-static      \
            --disable-debug       \
            --with-tls=openssl    \
            --with-cyrus-sasl     \
            --enable-dynamic      \
            --enable-crypt        \
            --enable-spasswd      \
            --enable-slapd        \
            --enable-modules      \
            --enable-rlookups     \
            --enable-backends=mod \
            --disable-ndb         \
            --disable-sql         \
            --disable-shell       \
            --disable-bdb         \
            --disable-hdb         \
            --enable-overlays=mod &&

make depend &&
make

# Test the result by typing that commands
make test

# Run the following at root user
sudo make install &&

sudo sed -e "s/\.la/.so/" -i /etc/openldap/slapd.{conf,ldif}{,.default} &&

sudo install -v -dm700 -o ldap -g ldap /var/lib/openldap     &&

sudo install -v -dm700 -o ldap -g ldap /etc/openldap/slapd.d &&
sudo chmod   -v    640     /etc/openldap/slapd.{conf,ldif}   &&
sudo chown   -v  root:ldap /etc/openldap/slapd.{conf,ldif}   &&

sudo install -v -dm755 /usr/share/doc/openldap-2.4.47 &&
sudo cp      -vfr      doc/{drafts,rfc,guide} \
                  /usr/share/doc/openldap-2.4.47


