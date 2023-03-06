#!/bin/bash
# Source: https://github.com/TDGalea/dpkg-install 

# Ensure root.
if [ `id -u` != "0" ];then
  echo -e "\e[1;31mError:\e[0m This script must be run as root."
  exit 9
fi

# Ensure arg 1 is passed.
if [ "$1" = "" ];then
  echo "Usage:"
  echo "       $0 [package-name.deb]"
  exit 0
fi

# Set dpkg location.
dpkg=/usr/bin/dpkg

# Check dpkg exists.
if [ ! -x "$dpkg" ];then
  # dpkg not in expected location. Try to use "whereis" to find it.
  if [ -x "/usr/bin/whereis" ];then
    # whereis exists. Use it.
    dpkg=`whereis dpkg|cut -d' ' -f2`
    # Check the given location will actually work.
    if [ ! -x "$dpkg" ];then
      echo -e "\e[1;31mError: \e[0mCannot use dpkg from $dpkg."
      exit 1
    fi
  else
    # whereis is not on this system.
    echo -e "\e[1;31mError: \e[0mCannot find dpkg."
    exit 1
  fi
fi

# Loop through multiple files.
for file in $@;do
  # Ensure file exists.
  if [ ! -f "$1" ];then
    echo -e "\e[1;31mErorr:\e[0m File '$1' does not exist."
    exit 2
  fi

  $dpkg -i $1
  # Check success.
  if [ "$?" != "0" ];then
    echo -e "\e[1;33mNote:\e[0m Package install failed. Trying to install dependencies."
    echo
    apt -y -f install
    # Try again.
    echo
    echo -e "\e[1;33mNote:\e[0m Retrying installation."
    $dpkg -i $1;err=$?
    # Check success.
    if [ "$err" != "0" ];then
      echo -e "\e[1;31mError:\e[0m Package installation failed."
      exit $err
    else
      echo -e "\e[1;32mSuccess:\e[0m Package installed following dependency installation."
      exit 0
    fi
  else
    echo -e "\e[1;32mSuccess:\e[0m Package installed."
    exit 0
  fi
done

echo -e "\e[1;31mEnd of script reached. How?\e[0m"
exit 8