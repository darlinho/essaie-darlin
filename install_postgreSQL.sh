#!/bin/bash

### You must first download and unpack the package 

wget http://ftp.postgresql.org/pub/source/v11.2/postgresql-11.2.tar.bz2

# Extract this file and enter to the create folder

tar zxvf http://ftp.postgresql.org/pub/source/v11.2/postgresql-11.2.tar.bz2
cd postgresql-11.2

### Installation of PostgreSQL

#For enhanced security, it is better to have a dedicated group and user for running the PostgreSQL server

sudo groupadd -g 41 postgres &&
sudo useradd -c "PostgreSQL Server" -g postgres -d /srv/pgsql/data \
     	   -u 41 postgres

# After this, install PostgreSQL with the following commands

sed -i '/DEFAULT_PGSOCKET_DIR/s@/tmp@/run/postgresql@' src/include/pg_config_manual.h &&

./configure --prefix=/usr          \
            --enable-thread-safety \
            --docdir=/usr/share/doc/postgresql-11.2 &&
make

# After that, do it at root user

sudo make install      &&
sudo make install-docs

# Initialize a database cluster with the following commands

sudo install -v -dm700 /srv/pgsql/data &&
sudo install -v -dm755 /run/postgresql &&
sudo chown -Rv postgres:postgres /srv/pgsql /run/postgresql

sudo su - postgres -c '/usr/bin/initdb -D /srv/pgsql/data'

### Switch to the parent directory
cd ..

### Delete create folder

rm -R postgresql-11.2

### END






