<!--documentation
---
title: "Archipelago-deployment: upgrading Drupal 9 to Drupal 10 (1.1.0 to 1.3.0)"
tags:
  - Archipelago-deployment
  - Drupal 9
  - Drupal 10
---
documentation-->

# Archipelago-deployment: upgrading Drupal 9 to Drupal 10 (1.1.0 to 1.3.0)

## What is this documentation for?

If you already have a well-set-up and well-loved Archipelago (1.1.0) running Drupal 9 (D9), this documentation will allow you to update to 1.3.0 on Drupal 10 (D10) without any major issues.

D9 is no longer supported as of the end of November 2023. D10 has been around for a little while, and even if every module is not supported yet, what you need and want for **Archipelago** has long been ready for D10. However, Archipelago is still D9 compatible if it's necessary for you to stay back a little longer.

## Requirements

- An [archipelago-deployment](https://github.com/esmero/archipelago-deployment) local instance 1.1.0 (working, tested) deployed using provided instructions via Docker and running Drupal 9.
- Basic knowledge and instincts (+ courage) on how to run Terminal Commands, `composer` and `drush`.
- Patience. You can't skip steps here.
- For shell Commands documented here please copy line by line--not the whole block.

## Backing up and preparing for the upgrade

Backups are always going to be your best friends. Archipelago's code, database, and settings are mostly self-contained in your current `archipelago-deployment` repo folder, and backing up is simple because of that.

### Step 1:

On a terminal, `cd` into your running `archipelago-deployment` folder and shut down your `docker-compose` ensemble by running the following:

```shell
docker-compose down
```

### Step 2:

Verify that all containers are actually down. The following command should return an empty listing:

```shell
docker ps
```

If anything is still running, wait a little longer and run the command again.

### Step 3:

Now let's `tar.gz` the whole ensemble with data and configs. As an example we will save this into your `$HOME` folder. 
As a good practice we append the **current date **(YEAR-MONTH-DAY) to the filename. Here we assume today is October 31st of 2023.

```shell
cd ..
sudo tar -czvpf $HOME/archipelago-deployment-D9-20231031.tar.gz archipelago-deployment
cd archipelago-deployment
```

The process may take a few minutes. Now let's verify that all is there and that the `tar.gz` is not corrupt.

```shell
tar -tvvf $HOME/archipelago-deployment-D9-20231031.tar.gz 
```

You will see a listing of files, and at the end you will see something like this: `Archive Format: POSIX pax interchange format, Compression: gzip`. If corrupt (Do you have enough space? Did your ssh connection drop?) you will see the following:

```shell
tar: Unrecognized archive format
```

### Step 4:

Restart your `docker-compose` ensemble, and wait a little while for all to start.

```shell
docker-compose up -d
```

### Step 5:

Export/backup all of your live Archipelago configurations (this allows you to compare/come back in case you lose something custom during the upgrade).

```shell
docker exec esmero-php mkdir config/backup
docker exec esmero-php drush cex --destination=/var/www/html/config/backup
```

Good. Now it's safe to begin the upgrade process.

___

## Upgrading to 1.3.0

### Step 1: Edit docker-composer.yml

First we are going to edit your docker-compose.yml file to reference the latest PHP container as needed. Starting in your Archipelago deployment directory location, run the following commands:

If you have not already, run:

```shell
docker-compose down
```

Then open your docker-compose.yml file:

```shell
nano docker-compose.yml
```

Inside your `docker-compose.yml` file, page down to the `php` section and change the `image` section to match exactly as follows:

```shell
image: "esmero/php-8.1-fpm:1.2.0-multiarch"
```

Next page down to the `iiif` section and change the `image` section to match exactly as follows:

```shell
image: "esmero/cantaloupe-s3:6.0.1-multiarch"
```

Save your changes.

### Step 2: docker pull and check

Time to fetch the latest branch and update our `docker compose` and `composer` dependencies. To pull the images and bring up the ensemble, run:

```shell
docker compose pull
docker compose up -d
```

Give all a little time to start. Please be patient. To ensure all is well, run (more than once if necessary) the following:

```shell
docker ps
```

You should see something like this: 

```shell
CONTAINER ID   IMAGE                                      COMMAND                  CREATED          STATUS          PORTS                              NAMES
355e13878b7e   nginx                                      "/docker-entrypoint.…"   10 minutes ago   Up 10 minutes   0.0.0.0:8001->80/tcp               esmero-web
86b685008158  solr:8.11.2                                 "docker-entrypoint.s…"   10 minutes ago   Up 10 minutes   0.0.0.0:8983->8983/tcp             esmero-solr
a8f0d9c6d4a9   esmero/cantaloupe-s3:6.0.1-multiarch       "sh -c 'java -Dcanta…"   10 minutes ago   Up 10 minutes   0.0.0.0:8183->8182/tcp             esmero-cantaloupe
6642340b2496   mariadb:10.6.12-focal                      "docker-entrypoint.s…"   10 minutes ago   Up 10 minutes   3306/tcp                           esmero-db
0aef7df34037   minio/minio:RELEASE.2022-06-11T19-55-32Z   "/usr/bin/docker-ent…"   10 minutes ago   Up 10 minutes   0.0.0.0:9000-9001->9000-9001/tcp   esmero-minio
28ee3fb4e7a7   esmero/php-8.1-fpm:1.2.0-multiarch         "docker-php-entrypoi…"   10 minutes ago   Up 10 minutes   9000/tcp                           esmero-php
a81c36d51a81   esmero/esmero-nlp:fasttext-multiarch       "/usr/local/bin/entr…"   10 minutes ago   Up 10 minutes   0.0.0.0:6400->6400/tcp             esmero-nlp
```

Important here is the `STATUS` column. It **needs** to be a number that goes up in time every time you run `docker ps` again (and again).

### Step 3. Updates for key Drupal and Archipelago modules

Now we are going to tell `composer` to update the key Drupal and Archipelago modules. 

First we are going to disable and remove a few minor Drupal modules. Run the following commands (in order):

```shell
docker exec -ti esmero-php bash -c "drush pm-uninstall fancy_file_delete"
docker exec -ti esmero-php bash -c "drush pm:uninstall quickedit"
docker exec -ti esmero-php bash -c "composer remove drupal/fancy_file_delete"
```

Now update the versions used for these Drupal modules:

```shell
docker exec -ti esmero-php bash -c "composer require drupal/jquery_ui_slider:^2 drupal/jquery_ui_effects:^2 drupal/jquery_ui:1.6 drupal/jquery_ui_datepicker:^2 drupal/jquery_ui_touch_punch:^1 drupal/better_exposed_filters:6.0.3 --no-update --with-all-dependencies"
```

And now update one other Drupal module and the main Archipelago modules:

```shell
docker exec -ti esmero-php bash -c "composer require 'drupal/views_bulk_operations:^4.2' 'strawberryfield/strawberryfield:1.3.0.x-dev' 'strawberryfield/webform_strawberryfield:1.3.0.x-dev' 'strawberryfield/format_strawberryfield:1.3.0.x-dev' 'strawberryfield/strawberry_runners:0.7.0.x-dev' 'archipelago/ami:0.7.0.x-dev' --no-update --with-all-dependencies"
```

From inside your `archipelago-deployment` repo folder we are now going to open up file `permissions` for some of your most protected Drupal files.

```shell
sudo chmod 777 web/sites/default
sudo chmod 666 web/sites/default/*settings.php
sudo chmod 666 web/sites/default/*services.yml
```

### Step 4: Disable/Remove for additional select Drupal modules

We are going to remove additional select Drupal modules that are not 1.3.0 or D10 compliant.

Please run each of the following commands separately, in order, and do not skip any commands.

```shell
docker exec -ti esmero-php bash -c "composer remove symfony/http-kernel symfony/yaml --no-update"
docker exec -ti esmero-php bash -c "composer require drupal/config_inspector:^2 --no-update" 
docker exec -ti esmero-php bash -c "drush pm:uninstall jsonapi_earlyrendering_workaround"
docker exec -ti esmero-php bash -c "composer remove drupal/jsonapi_earlyrendering_workaround --no-update"
docker exec -ti esmero-php bash -c "composer require 'drupal/core:^10' 'drupal/core-recommended:^10' 'drupal/core-composer-scaffold:^10' 'drupal/core-project-message:^10' --update-with-dependencies --no-update"
docker exec -ti esmero-php bash -c "composer require 'drupal/core-dev:^10' --dev --update-with-dependencies --no-update"
docker exec -ti esmero-php bash -c "composer require 'drush/drush:^12' --no-update"
docker exec -ti esmero-php bash -c "composer require drupal/twig_tweak:^2 --no-update"
docker exec -ti esmero-php bash -c "composer require drupal/config_inspector:^2 --no-update"
docker exec -ti esmero-php bash -c "composer require drupal/config_update:2.0.x-dev --no-update"
docker exec -ti esmero-php bash -c "composer remove drupal/config_update_ui --no-update"
docker exec -ti esmero-php bash -c "composer require 'drupal/context:^5.0@RC' --no-update"
docker exec -ti esmero-php bash -c "composer require 'drupal/devel:^5.1' --no-update"
docker exec -ti esmero-php bash -c "composer remove drupal/sophron --no-update"
docker exec -ti esmero-php bash -c "composer remove fileeye/mimemap --no-update"
docker exec -ti esmero-php bash -c "composer require drupal/imagemagick:^3 --no-update"  
docker exec -ti esmero-php bash -c "composer remove fileeye/mimemap --no-update"    
docker exec -ti esmero-php bash -c "drush pm:uninstall jsonapi_earlyrendering_workaround"
docker exec -ti esmero-php bash -c "composer remove drupal/jsonapi_earlyrendering_workaround --no-update"
docker exec -ti esmero-php bash -c "composer require 'drupal/imce:^3.0' --no-update" 
docker exec -ti esmero-php bash -c "composer require 'drupal/search_api_attachments:^9.0' --no-update" 
docker exec -ti esmero-php bash -c "composer require 'drupal/twig_tweak:^3.2' --no-update"
docker exec -ti esmero-php bash -c "composer require 'drupal/webform_entity_handler:^2.0' --no-update"
docker exec -ti esmero-php bash -c "composer require 'drupal/webformnavigation:^2.0' --no-update"
docker exec -ti esmero-php bash -c "composer remove drupal/form_mode_manager --no-update"
```

Well done! If you see **no** issues and all ends in **Green colored messages**, all is good!  [Jump to Step 5](#step-5-update-composerjson)

#### What if all is not OK, and I see red and a lot of dependency explanations?

If you have manually installed packages via composer in the past that are NO longer Drupal 10 compatible you may see errors. 
In that case you need to check each package website's (normally https://www.drupal.org/project/the_module_name) and check if there is a Drupal 10 compatible version. 

If so run:

```shell
docker exec -ti esmero-php bash -c "composer require 'drupal/the_module_name:^VERSION_NUMBER_THAT_WORKS_ON_DRUPAL10_' --update-with-dependencies --no-update" and run **Step 3 ** again (and again until all is cleared)
```

If not, try to find a replacement module that does something similar, but in any case you may end up having to remove before proceeding. Give us a ping/slack/google group/open a github ISSUE if you find yourself uncertain about this. 

```shell
docker exec -ti esmero-php bash -c "drush pm-uninstall the_module_name"
docker exec -ti esmero-php bash -c "composer remove drupal/the_module_name --no-update"
```

### Step 5: Update composer.json

Now you need to update your `composer.json` file to include an important patch. Starting in your Archipelago deployment directory location, run the following commands:

```shell
nano composer.json
```

Inside your `composer.json` file, page down to the `"patches"` section and change the section to match exactly as follows:

```shell
"patches": {
      "drupal/form_mode_manager": {
       "D10 compatibility": "https://www.drupal.org/files/issues/2023-10-11/3297262-20.patch"
      },
      "drupal/ds": {
       "https://www.drupal.org/project/ds/issues/3338860": "https://www.drupal.org/files/issues/2023-04-04/3338860-5-d10-compatible_0.patch"
      }
    }
```

Save your changes and then run:

```shell
docker exec -ti esmero-php bash -c "composer update -W"
```

### Step 6: One final round of Drupal module updates

We will now run a few more updates for additional Drupal modules.

Please run each of the following commands separately, in order, and do not skip any commands.

```shell  
docker exec -ti esmero-php bash -c "composer require mglaman/composer-drupal-lenient"
docker exec -ti esmero-php bash -c "composer config --merge --json extra.drupal-lenient.allowed-list '[\"drupal/form_mode_manager\"]'"
docker exec -ti esmero-php bash -c "composer require 'drupal/form_mode_manager:2.x-dev@dev'"
docker exec -ti esmero-php bash -c "composer require 'drupal/color:^1.0'" 
docker exec -ti esmero-php bash -c "composer require drupal/hal"  
docker exec -ti esmero-php bash -c "composer require drupal/aggregator"
docker exec -ti esmero-php bash -c "composer require drupal/ckeditor"  
docker exec -ti esmero-php bash -c "composer require drupal/seven"
docker exec -ti esmero-php bash -c "composer require archipelago/archipelago_subtheme:1.3.0.x-dev"
docker exec -ti esmero-php bash -c "drush pm:uninstall quickedit"
docker exec -ti esmero-php bash -c "composer require drupal/quickedit drupal/classy drupal/stable"
docker exec -ti esmero-php bash -c "drush pm:uninstall hal"
docker exec -ti esmero-php bash -c "drush pm:install jquery_ui"
```

Whew, that's a lot of module updates! Now run one final database update command:

```shell  
docker exec -ti esmero-php bash -c "drush updatedb"
```

### Step 7: Optional Syncs

Optionally, you can sync your new Archipelago 1.3.0 and bring in all the latest configs and settings. For this you have **two** options (no worries, remember you made a backup!):

#### A Partial Sync, which will bring new configs and update existing ones but will **not** remove ones that only exist in your custom setup, e.g. new Webforms or View Modes.

```shell 
docker exec esmero-php drush cim -y --partial   
```

#### A Complete Sync, which will bring new things and update existing but will also remove all the ones that are not part of 1.3.0. It's a like clean factory reset.

```shell 
docker exec esmero-php drush cim -y 
```

If all goes well here and you see no errors it's time to reindex `Solr` because there are new Fields. Run the following:

```shell 
docker exec esmero-php drush search-api-reindex
docker exec esmero-php drush search-api-index
```

You might see some warnings related to modules dealing with previously non-existent data—no worries, just ignore those.

If you made it this far you are done with code/devops (are we ever ready?), and that means you should be able to (hopefully) stay in the Drupal 10 realm for a few years!

### Step 8: Update (or not) your Metadata Display Entities and menu items

Recommended: If you want to add new templates and menu items 1.3.0 provides, run this:

```shell
docker exec -ti esmero-php bash -c 'scripts/archipelago/deploy.sh'
```

Once that is done, you can choose to update all Metadata Displays (twig templates) we ship with new 1.3.0 versions (heavily adjusted IIIF manifests, better Object description template using Macros). Before you do this, we **strongly** recommend that you first make sure to manually (copy/paste) backup any Twig templates you have modified. If unsure, do not run the command that comes after this warning! You can always manually copy the new templates from the `d8content/metadatadisplays` folder which contains text versions (again, copy/paste) of each shipped template you can pick and use when you feel ready. 

If you are sure (like really?) you want to overwrite the ones you modified (sure, just checking?), then you can run this:

```shell
docker exec -ti esmero-php bash -c 'scripts/archipelago/update_deployed.sh'
```

Done! (For realz now) 

### Step 9 (or should we say 10)

Please login to your Archipelago and test/check all is working! Enjoy 1.3.0 and Drupal 10. Thanks!

___

### Need help? Blue Screen? Missed a step? Need a hug and such?

If you see any issues or errors or need help with a step, please let us know (ASAP!). You can either open an `issue` in this repository or use the [Google Group](https://groups.google.com/forum/#!forum/archipelago-commons). We are here to help.

## Caring & Coding + Fixing + Testing

* [Diego Pino](https://github.com/DiegoPino)
* [Allison Sherrick](https://github.com/alliomeria)
* [Giancarlo Birello](https://github.com/giancarlobi)

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
