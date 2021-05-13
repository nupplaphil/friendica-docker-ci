#!/bin/bash
#
# Checks the PHP CS syntax
#
if ! echo "${CHANGED_FILES}" | grep -qE "^(\\.php_cs(\\.dist)?|composer\\.lock)$"; then
  EXTRA_ARGS=$(printf -- '--path-mode=intersection\n--\n%s' "${CHANGED_FILES}");
else
  EXTRA_ARGS='';
fi

./bin/dev/php-cs-fixer/vendor/bin/php-cs-fixer fix --config=.php_cs.dist -v --diff --diff-format=udiff --dry-run --using-cache=no ${EXTRA_ARGS}
