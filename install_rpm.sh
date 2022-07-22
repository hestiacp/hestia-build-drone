#!/bin/bash
source ./clone_hestiacp.sh

SOFTWARE='gcc gcc-c++ make libxml2-devel zlib-devel libzip-devel gmp-devel libcurl-devel gnutls-devel unzip openssl openssl-devel pkg-config sqlite-devel oniguruma-devel rpm-build wget tar git curl perl-IPC-Cmd'

echo "Updating system DNF repositories..."
dnf install -y -q 'dnf-command(config-manager)'
dnf install -y -q dnf-plugins-core
dnf config-manager --set-enabled crb
dnf config-manager --set-enabled codeready-builder
dnf config-manager --set-enabled powertools 
dnf config-manager --set-enabled PowerTools
dnf upgrade -y -q
echo "Installing dependencies for compilation..."

dnf install -y -q $SOFTWARE

# make sure to delete all old  traces
rm -rf /hestiacp/

git clone https://github.com/$fork/hestiacp.git
cd ./hestiacp/
git checkout $branch

echo "Start building HestiaCP Packages"
export TERM=xterm