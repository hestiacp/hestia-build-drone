#!/bin/bash

# Branch to build packages from.
fork="hestiacp"
branch="staging/1.6.1"

# make sure to delete all old  traces
rm -rf /hestiacp/

git clone https://github.com/$fork/hestiacp.git
cd ./hestiacp/
git checkout $branch

echo "Start building HestiaCP Packages"
export TERM=xterm
