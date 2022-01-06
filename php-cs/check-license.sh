#!/bin/bash
#
# Checks if the license header is correct
#

[[ -z "${CHANGED_FILES}" ]] && exit 0

IFS=' ' read -ra files <<<"${CHANGED_FILES//$'\n'/ }"

current_year=$(date +"%Y")
php_template_md5=$(sed "s/%%YEAR%%/$current_year/g" "mods/license/license_php.template" | md5sum)
php_template_rows=$(wc -l "mods/license/license_php.template" | cut -d" " -f1)

exitVal=0

printf "\n"

for file in "${files[@]}"; do
	php_license_md5=$(head -n "$php_template_rows" "$file" | md5sum)
	[[ "$php_template_md5" != "$php_license_md5" ]] && printf " - %s\n" "$file" && exitVal=1
done

[[ $exitVal != 0 ]] && echo "License headers are missing or wrong"

exit $exitVal
