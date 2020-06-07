#!/bin/bash
if [ $EUID != 0 ]; then
    echo "Superuser access is required"
    exit 1
fi

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

sudo apt-get autoremove
sudo apt-get clean
sudo journalctl --vacuum-size=10M
sudo journalctl --vacuum-time=10m

exit 0
