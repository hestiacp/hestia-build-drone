#!/bin/bash
source ./clone_hestiacp.sh

software="build-essential libxml2-dev libz-dev libzip-dev libgmp-dev libcurl4-gnutls-dev unzip openssl libssl-dev pkg-config libsqlite3-dev libonig-dev rpm git wget curl"
apt-get update && apt-get install -y $software 

# make sure to delete all old  traces
rm -rf /hestiacp/

git clone https://github.com/$fork/hestiacp.git
cd ./hestiacp/
git checkout $branch

echo "Start building HestiaCP Packages"
export TERM=xterm
