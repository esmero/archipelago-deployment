#!/bin/bash

# Part of the Archipelago Commons Project
# This should be run as: docker exec -ti esmero-php bash -c 'scripts/archipelago/update.sh'

echo -ne "Updating Archipelago Packages to whatever is latest in this release!\n"
echo -ne "Running as " && whoami;
composer update strawberryfield/strawberryfield strawberryfield/format_strawberryfield strawberryfield/webform_strawberryfield archipelago/archipelago_subtheme --no-scripts;
(($? != 0)) && { printf '%s\n' "Updating strawberryfield packages via composer failed"; exit 1; }
drush status bootstrap | grep -q Successful;
(($? == 0)) && { drush cr; }
echo -ne "Taking ownership of drupal modules for the www-data user, this can take a little while!" && chown -R www-data web/modules/* vendor/*;
echo -e "If you see no errors, you are up to date! Done."
