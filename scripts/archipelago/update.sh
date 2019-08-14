#!/bin/bash
echo -e "Updating Archipelago Packages to whatever is latest in this release!\n"
echo -e "Running as " && whoami;
composer update strawberryfield/strawberryfield strawberryfield/format_strawberryfield strawberryfield/webform_strawberryfield archipelago/archipelago_subtheme --no-scripts;
(($? != 0)) && { printf '%s\n' "Updating strawberryfield packages via composer failed"; exit 1; }
drush status bootstrap | grep -q Successful;
(($? == 0)) && { drush cr; }
echo -e "If you see no errors, you are up to date!"
