#!/bin/bash

if [ "$hestia" = 'yes' ]; then
    ./hestiacp/src/hst_autocompile.sh --dontinstalldeps --hestia --noinstall --keepbuild --debug '~localsrc'
fi
if [ "$nginx" = 'yes' ]; then
    ./hestiacp/src/hst_autocompile.sh --dontinstalldeps --nginx --noinstall --keepbuild --debug '~localsrc'
fi
if [ "$php" = 'yes' ]; then
    ./hestiacp/src/hst_autocompile.sh --dontinstalldeps --php --noinstall --keepbuild --debug '~localsrc'
fi