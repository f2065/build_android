#!/bin/bash

function update_alias {
command_alias_full="alias $1='$2'"
if grep -q -x "$command_alias_full" ~/.bash_aliases; then
  :
else
  echo $command_alias_full >> ~/.bash_aliases
fi
}

function run_term_M2 {
  gnome-terminal \
  --window --working-directory="$HOME/$1" \
  --tab --working-directory="$HOME/$1/kernel/sony/msm8226" \
  --tab --working-directory="$HOME/$1/device/sony/eagle" \
  --tab --working-directory="$HOME/$1/device/sony/yukon"
}


update_alias "gcpa" "git cherry-pick --abort"
update_alias "gcpc" "git cherry-pick --continue"
update_alias "gcp" "git cherry-pick"
update_alias "gitlog" "git log --oneline --no-abbrev-commit"

echo
echo
echo "Select sources folder:"
select FOLDER in \
"src_M2_LOS141" \
"src_M2_LOS151" \
"src_M2_LOS160" \
"src_M2_LOS171" \
"src_M2_LOS181" \
"src_M2_TWRP_LOS"
do
  break
done

run_term_M2 $FOLDER

exit
