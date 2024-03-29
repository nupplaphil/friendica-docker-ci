#!/bin/bash
#
# Checks the addons messages.po files
#
DIR=${FRIENDICA_DIR:-$PWD}
ADDON_DIR=${FRIENDICA_ADDON_DIR:-"$DIR/addon"}

cd $ADDON_DIR

# Skip first 4 lines in possible diff, because they're header
# Skip all lines of the git diff starting with "@@" or comments or starting "POT-Creation-Date"
if [[ $(git diff -U0 **/messages.po | grep -vE '^(@@|\-"POT-Creation-Date|\+"POT-Creation-Date|\-#|\+#|\-\-\-|\+\+\+|index\ |diff\ \-\-git)' | wc -l) -gt 0 ]]; then
	echo "$(git diff **/messages.po)"
	exit 1
else
	echo "\033[1mNothing to update\033[0m"
fi
