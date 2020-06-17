#!/bin/bash

# First Download the package

wget https://downloads.sourceforge.net/lsb/lsb-release-1.4.tar.gz

# Extract the package and enter in that directory

tar zxvf lsb-release-1.4.tar.gz
cd lsb-release-1.4

## Installation of lsb_release

# first fix a minor display problem

sed -i "s|n/a|unavailable|" lsb_release

# Run this at root user
sudo ./help2man -N --include ./lsb_release.examples \
              --alt_version_key=program_version ./lsb_release > lsb_release.1
              
sudo install -v -m 644 lsb_release.1 /usr/share/man/man1 &&
sudo install -v -m 755 lsb_release   /usr/bin

## Go to the parent directory

cd ..

## Delete extract folder

rm -R lsb-release-1.4

## End
