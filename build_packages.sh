#!/bin/bash
export TERM=xterm

./hestiacp/src/hst_autocompile.sh --all --noinstall --keepbuild --debug '~localsrc'
if [ ! -f '/etc/redhat-release' ]; then
    # Install first HestiaCP
    ./dpkg-install.sh /tmp/hestiacp-src/deb/hestia_*.deb
    if [ "$?" -ne 0 ]; then exit 1; fi
    ./dpkg-install.sh /tmp/hestiacp-src/deb/hestia-*.deb
    if [ "$?" -ne 0 ]; then exit 1; fi    
    fi
    exit 0;
fi

exit 0;