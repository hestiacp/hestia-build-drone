#!/bin/bash

# Branch to be build from
fork="hestiacp"
branch="staging/1.5.4"
software="build-essential libxml2-dev libz-dev libzip-dev libgmp-dev libcurl4-gnutls-dev unzip openssl libssl-dev pkg-config libsqlite3-dev libonig-dev rpm git wget curl"
# make sure to delete all old  traces
rm -rf /hestiacp/

apt-get update && apt-get install -y $software 
git clone https://github.com/$fork/hestiacp.git
cd ./hestiacp/
git checkout $branch
