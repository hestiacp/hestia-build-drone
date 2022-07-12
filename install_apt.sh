#!/bin/bash
software="build-essential libxml2-dev libz-dev libzip-dev libgmp-dev libcurl4-gnutls-dev unzip openssl libssl-dev pkg-config libsqlite3-dev libonig-dev rpm git wget curl"
apt-get update && apt-get install -y $software 