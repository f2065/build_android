#!/bin/bash
if [ $EUID != 0 ]; then
    echo "Superuser access is required"
    exit 1
fi

apt-get update
apt-get upgrade
apt-get dist-upgrade

./system_clean.sh

exit 0
