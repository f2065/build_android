#!/bin/bash


if [ "$1" == "init" ] || [ "$1" == "pvt" ] || [ "$1" == "all" ]
then
./repo_sync_twrp.sh $1
./repo_sync_14.sh $1
./repo_sync_15.sh $1
#./repo_sync_15a.sh $1
#./repo_sync_15r.sh $1
./repo_sync_16.sh $1
./repo_sync_17.sh $1
else
echo "*** Exit. Unknown command. Allowed command: init, pvt, all.***"
exit
fi

exit
