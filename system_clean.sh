#!/bin/bash
if [ $EUID != 0 ]; then
    echo "Superuser access is required"
    exit 1
fi

printf "\033]2;%s Clean system...\007" $(date +"%Y-%m-%d_%H:%M:%S")
echo "Clean system..."

apt-get autoremove
apt-get clean
journalctl --vacuum-size=10M
journalctl --vacuum-time=10m

e4defrag /

vmware-toolbox-cmd disk wipe /

exit
