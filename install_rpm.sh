#!/bin/bash
source ./clone_hestiacp.sh

release=$(grep -o "[0-9]" /etc/redhat-release |head -n1);

if [ "$release" = '9' ]; then
    SOFTWARE='git gcc gcc-c++ make libxml2-devel zlib-devel libzip-devel gmp-devel libcurl-devel gnutls-devel unzip openssl openssl-devel pkg-config sqlite-devel oniguruma-devel rpm-build wget tar git curl perl-IPC-Cmd perl-File-Copy-Recursive perl-FindBin perl-File-Compare'
else
    SOFTWARE='git gcc gcc-c++ make libxml2-devel zlib-devel libzip-devel gmp-devel libcurl-devel gnutls-devel unzip openssl openssl-devel pkg-config sqlite-devel oniguruma-devel rpm-build wget tar git curl perl-IPC-Cmd perl-File-Copy-Recursive git'
fi

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