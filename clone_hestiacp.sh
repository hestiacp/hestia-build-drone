#!/bin/bash

# Branch to be build from
rm -rf /hestiacp/
branch="staging/1.5.3"
apt-get update && apt-get install git wget curl -y
git clone https://github.com/hestiacp/hestiacp.git
cd ./hestiacp/
git checkout $branch