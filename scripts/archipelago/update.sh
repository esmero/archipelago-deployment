#!/bin/bash

# Part of the Archipelago Commons Project
# This should be run as: docker exec -ti esmero-php bash -c 'scripts/archipelago/update.sh'
# If you Host Machine (the one where your keyboard and screen is attached!) has 4Gbytes, memory can run out during
# composer update (you will see a "killed" message. We recommend:
# Do a docker ps first and stop every container except esmero-php and esmero-web. 
# Re run this script.

echo -ne "Updating Archipelago Packages to whatever is latest in this release!\n"
echo -ne "Running as " && whoami;
composer update archipelago/ami strawberryfield/strawberry_runners strawberryfield/strawberryfield strawberryfield/format_strawberryfield strawberryfield/webform_strawberryfield archipelago/archipelago_subtheme --no-scripts;
(($? != 0)) && { printf '%s\n' "Updating strawberryfield packages via composer failed"; exit 1; }
drush status bootstrap | grep -q Successful;
(($? == 0)) && { drush cr; }
echo -ne "Taking ownership of drupal modules for the www-data user, this can take a little while!" && chown -R www-data web/modules/* vendor/*;
echo -e "If you see no errors, you are up to date! Done."
