#!/bin/bash
source ./clone_hestiacp.sh

if [ "$all" = 'yes' ]; then
    ./hestiacp/src/hst_autocompile.sh --dontinstalldeps --all --noinstall --keepbuild --debug '~localsrc'
    if [ ! -f '/etc/redhat-release' ]; then
    ./dpkg-install.sh /tmp/hestiacp-src/deb/*.deb
    fi
    exit 0;
fi

# For only hestia there are better / faster methods
if [ "$hestia" = 'yes' ]; then
    ./hestiacp/src/hst_autocompile.sh --dontinstalldeps --hestia --noinstall --keepbuild --debug '~localsrc'
fi

if [ "$nginx" = 'yes' ]; then
    ./hestiacp/src/hst_autocompile.sh --dontinstalldeps --nginx --noinstall --keepbuild --debug '~localsrc'
fi

if [ "$php" = 'yes' ]; then
    ./hestiacp/src/hst_autocompile.sh --dontinstalldeps --php --noinstall --keepbuild --debug '~localsrc'
fi

