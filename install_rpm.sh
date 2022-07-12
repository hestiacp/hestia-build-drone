#!/bin/bash

SOFTWARE='gcc gcc-c++ make libxml2-devel zlib-devel libzip-devel gmp-devel libcurl-devel gnutls-devel unzip openssl openssl-devel pkg-config sqlite-devel oniguruma-devel rpm-build wget tar git curl perl-IPC-Cmd'

echo "Updating system DNF repositories..."
dnf install -y -q 'dnf-command(config-manager)'
dnf install -y -q dnf-plugins-core
dnf config-manager --set-enabled powertools > /dev/null 2>&1
dnf config-manager --set-enabled PowerTools > /dev/null 2>&1
dnf upgrade -y -q
echo "Installing dependencies for compilation..."

dnf install -y -q $SOFTWARE