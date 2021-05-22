#!/bin/bash
#
# Checks the addons messages.po files
#
DIR=${FRIENDICA_DIR:-$PWD}
ADDON_DIR=${FRIENDICA_ADDON_DIR:-"$DIR/addon"}

cd $ADDON_DIR
changed_files=($(git diff --name-status ${DRONE_COMMIT_BEFORE}..${DRONE_COMMIT_AFTER}  | cut -f2 | sed '/^\./d' | cut -d "/" -f1 | uniq))
cd $DIR
for addon in "${changed_files[@]}"; do
	./bin/run_xgettext.sh --addon $addon;
done
