#!/bin/bash
#
# Checks the addons messages.po files
#
DIR=${FRIENDICA_DIR:-$PWD}
ADDON_DIR=${FRIENDICA_ADDON_DIR:-"$DIR/addon"}
CHANGED_FILES=${CHANGED_FILES:-"${DRONE_COMMIT_BEFORE}..${DRONE_COMMIT_AFTER}"}

cd "$ADDON_DIR" || exit 1
changed_files=($(git diff --diff-filter=ACM --name-status "${CHANGED_FILES}"  | cut -f2 | sed '/^\./d' | cut -d "/" -f1 | uniq))
cd "$DIR" || exit 1
for addon in "${changed_files[@]}"; do
	./bin/run_xgettext.sh --addon "$addon";
done
