#!/bin/bash
#
# Checks the default messages.po file
#

# Skip first 4 lines in possible diff, because they're header
# Skip all lines of the git diff starting with "@@" or comments or starting "POT-Creation-Date"
if [[ $(git diff -U0 ./view/lang/C/messages.po | grep -vE '^(@@|\-"POT-Creation-Date|\+"POT-Creation-Date|\-#|\+#)' | wc -l) -gt 4 ]]; then
	echo "$(git diff ./view/lang/C/messages.po)"
	exit 1
else
	echo "\033[1mNothing to update\033[0m"
fi
