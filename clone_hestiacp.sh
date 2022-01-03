#!/bin/bash

# Branch to be build from
branch="staging/1.5.3"
apt install git -y
git clone https://github.com/hestiacp/hestiacp.git
git checkout $branch