#!/bin/bash
if [ $EUID != 0 ]; then
    echo "Superuser access is required"
    exit 1
fi

vmware-toolbox-cmd disk shrinkonly

exit
