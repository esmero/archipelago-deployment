<!--documentation
---
title: "Archipelago-deployment: upgrading to 1.0.0 (1.0.0-RC3 to 1.0.0)"
tags:
  - Archipelago-deployment
  - Drupal 9
---
documentation-->

# Archipelago-deployment: upgrading from 1.0.0-RC3 to 1.0.0

## What is this documentation for?

If you already have a well-set-up and well-loved Archipelago (RC3 or your own custom version) running Drupal 9, this documentation will allow you to update to 1.0.0 without major issues.

## Requirements

- An [archipelago-deployment](https://github.com/esmero/archipelago-deployment) instance 1.0.0-RC3 (working, tested) deployed using provided instructions via Docker and running Drupal 9.
- Basic knowledge and instincts (+ courage) on how to run Terminal Commands, `composer` and `drush`.
- Patience. You can't skip steps here.
- For Shell Commands documented here please copy line by line—not the whole block.

## Backing up and preparing for the upgrade

Backups are always going to be your best friends. Archipelago's code, database and settings are mostly self-contained in your current `archipelago-deployment-live` repo folder, and backing up is simple because of that.

### Step 1:

Shut down your `docker-compose` ensemble. Move to your `archipelago-deployment` folder and run this:

```shell
docker-compose down
```

### Step 2:

Verify that all containers are actually down. The following command should return an empty listing. If anything is still running, wait a little longer, and run the following comman again.

```shell
docker ps
```

### Step 3:

Now let's `tar.gz` the whole ensemble with data and configs. As an example we will save this into your `$HOME` folder.
As a good practice we append the **current date **(YEAR-MONTH-DAY) to the filename. Here we assume today is August 3rd of 2022.

```shell
cd ..
sudo tar -czvpf $HOME/archipelago-deployment-RC3-backup-20220803.tar.gz archipelago-deployment
cd archipelago-deployment
```

The process may take a few minutes. Now let's verify that all is there and that the `tar.gz` is not corrupt.

```shell
tar -tvvf $HOME/archipelago-deployment-RC3-backup-20220803.tar.gz 
```

You will see a listing of files. If corrupt (Do you have enough space? Did your ssh connection drop?) you will see the following:

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

Good. Now it's safe to begin the upgrade.

___

## Upgrading to 1.0.0

### Step 1:

First we are going to disable modules that are not part of 1.0.0 or are not yet compatible with Drupal 9.4.x or higher. Run the following command:

```shell
docker exec esmero-php drush pm-uninstall search_api_solr_defaults entity_reference
```

From inside your `archipelago-deployment` repo folder we are going to open up the file `permissions` for some of your most protected Drupal files.

```shell
sudo chmod 777 web/sites/default
sudo chmod 666 web/sites/default/*settings.php
sudo chmod 666 web/sites/default/*services.yml
```

If on a Linux or Windows 10/11 with Windows Subsystem for Linux (WSL) host we are going to open up these additional permissions:

```shell
sudo chown -R $USER:$USER web/sites/default/files/color
sudo find web/sites/default/files/color -type d -exec chmod 755 {} + 
```

### Step 2:

Time to fetch the `1.0.0` branch and update our `docker-compose` and `composer` dependencies. We are also going to stop the current `docker` ensemble to update all containers to newer versions:

```shell
docker-compose down
```


```shell
git checkout 1.0.0 
```

Then copy the appropriate `docker-compose` file for your architecture:

<!--switch_below

??? info "OSX (macOS) Intel/x86-64"

    ```shell
    cp docker-compose-osx.yml docker-compose.yml
    ```

??? info "Linux/x86-64/AMD64"

    ```shell
    cp docker-compose-linux.yml docker-compose.yml
    ```

??? info "OSX (macOS) M1 and M2/Linux/ARM64"

    ```shell
    cp docker-compose-arm64.yml docker-compose.yml
    ```

switch_below-->

___

OSX (macOS) Intel/x86-64:

```shell
cp docker-compose-osx.yml docker-compose.yml
```

___

Linux/x86-64/AMD64:

```shell
cp docker-compose-linux.yml docker-compose.yml
```

___

OSX (macOS) M1 and M2/Linux/ARM64:

```shell
cp docker-compose-arm64.yml docker-compose.yml
```

___

<!--switch_above
switch_above-->

Finally, pull the images

```shell
docker-compose pull 
```

1.0.0 provides a new Cantaloupe that uses different permissions so we need to adapt those. From your current folder run:

```shell
sudo chown 8183:8183 persistent/iiifconfig/cantaloupe.properties
sudo chown -R 8183:8183 persistent/iiifcache
```

Time to start the ensemble again

```shell
docker-compose up -d
```

Give all a little time to start. `Solr` core and `Database` need to be upgraded, Cantaloupe is new and this brings also Redis for caching. Please be patient. To ensure all is well, run (more than once if necessary) the following:

```shell
docker ps
```

You should see something like this: 
e.g if running on ARM64 You should see something like this: 

```shell
CONTAINER ID   IMAGE                                    COMMAND                  CREATED          STATUS          PORTS                                                           NAMES
4ed2f62e866e   jonasal/nginx-certbot                      "/docker-entrypoint.…" 32 seconds ago   Up 27 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp, 0.0.0.0:443->443/tcp, :::443->443/tcp   esmero-web
e6b4383039c3   minio/minio:RELEASE.2022-06-11T19-55-32Z   "/usr/bin/docker-ent…" 33 seconds ago   Up 30 seconds   0.0.0.0:9000-9001->9000-9001/tcp, :::9000-9001->9000-9001/tcp              esmero-minio
f2b6b173b7e2   solr:8.11.2                                "docker-entrypoint.s…" 33 seconds ago   Up 28 seconds   0.0.0.0:8983->8983/tcp, :::8983->8983/tcp                                  esmero-solr
a553bf484343   esmero/php-8.0-fpm:1.0.0-multiarch         "docker-php-entrypoi…" 33 seconds ago   Up 30 seconds   9000/tcp                                                                   esmero-php
ecb47349ae94   esmero/esmero-nlp:fasttext-multiarch       "/usr/local/bin/entr…" 33 seconds ago   Up 30 second    0.0.0.0:6400->6400/tcp, :::6400->6400/tcp                                  esmero-nlp
61272dce034a   redis:6.2-alpine                           "docker-entrypoint.s…" 33 seconds ago   Up 28 seconds                                                                              esmero-redis
0ee9869f809b   esmero/cantaloupe-s3:6.0.0-multiarch       "sh -c 'java -Dcanta…" 33 seconds ago   Up 28 seconds   0.0.0.0:8183->8182/tcp, :::8183->8182/tcp                                  esmero-cantaloupe
131d072567ce   mariadb:10.6.8-focal                       "docker-entrypoint.s…" 33 seconds ago   Up 28 seconds   3306/tcp                                                                   esmero-db                                            esmero-php
```

Important here is the `STATUS` column. It **needs** to be a number that goes up in time every time you run `docker ps` again (and again).

### Step 3:

Now we are going to tell `composer` to actually fetch the new code and dependencies using `composer.lock` and update the whole Drupal/PHP/JS environment.

```shell
docker exec -ti esmero-php bash -c "composer update -W"
docker exec -ti esmero-php bash -c "drush cr"
docker exec -ti esmero-php bash -c "drush en jquery_ui_touch_punch"
docker exec -ti esmero-php bash -c "drush updatedb"
```

Well done! If you see **no** issues and all ends in a **Green colored message** all is good! [Jump to Step 4](#step-4_1)

#### What if not all is OK and I see red and a lot of dependency explanations?

If you have manually installed packages via composer in the past that are NO longer Drupal 9 compatible you may see errors. 
In that case you need to check each package website's (normally https://www.drupal.org/project/the_module_name) and check if there is a Drupal 9 compatible version. 

If so run:

```shell
docker exec -ti esmero-php bash -c "composer require 'drupal/the_module_name:^VERSION_NUMBER_THAT_WORKS_ON_DRUPAL9_' --update-with-dependencies --no-update" and run **Step 3 ** again (and again until all is cleared)
```

If not: try to find a replacement module that does something simular, but in any case you may end having to remove before proceding. Give us a ping/slack/google group/open a github ISSUE if you find yourself uncertain about this. 

```shell
docker exec -ti esmero-php bash -c "composer remove drupal/the_module_name --no-update"
docker exec -ti esmero-php bash -c "drush pm-uninstall the_module_name"
```

### Step 4:

We will now ask Drupal to update some internal configs and databases. They will bring you up to date with 1.0.0 settings and D9 particularities.

```shell  
docker exec -ti esmero-php bash -c 'scripts/archipelago/setup.sh'
docker exec -ti esmero-php bash -c "drush updatedb"
```

### Step 5:

Now you can Sync your new Archipelago 1.0.0 and bring all the new configs and settings in. For this you have **two** options (no worries, remember you made a backup!):

#### A Partial Sync, which will bring new configs and update existing ones but will **not** remove ones that only exist in your custom setup, e.g. new Webforms or View Modes.

```shell 
docker exec esmero-php drush cim -y --partial
```

#### A Complete Sync, which will bring new configs and update existing ones but will also remove all the ones that are not part of 1.0.0. It's a like clean factory reset.

```shell 
docker exec esmero-php drush cim -y
```

If all goes well here and you see no errors it's time to reindex `Solr` because there are new Fields. Run the following:

```shell 
docker exec esmero-php drush search-api-reindex
docker exec esmero-php drush search-api-index
```

You might see some warnings related to modules dealing with previously non-existent data—no worries, just ignore those.

If you made it this far you are done with code/devops (are we ever ready?), and that means you should be able to (hopefully) stay in the Drupal 9 realm for a few years!

### Step 7: Update (or not) your Metadata Display Entities and Menu items.

Recommended: If you want to add new templates and menu items 1.0.0 provides, run this:

```shell
docker exec -ti esmero-php bash -c 'scripts/archipelago/deploy.sh'
```

Once that is done, you can choose to update all Metadata Displays (Twig templates) we ship with new 1.0.0 versions (heavily fixed IIIF manifest, Markdown to HTML for Metadata, better Object descriptions). But before you do this, we **really** recommend that you first make sure to manually (copy/paste) backup any Twig templates you have modified. If unusure, do not run the command that comes after this warning! You can always manually copy the new templates from the `d8content/metadatadisplays` folder which contains text versions (again, copy/paste) of each shipped template you can pick and use when you feel ready.

If you are sure (like really?) you want to overwrite the ones you modified (sure, just checking?), then you can run this:

```shell
docker exec -ti esmero-php bash -c 'scripts/archipelago/update_deployed.sh'
```

Done! (For realz now)

Please log into your Archipelago and test/check all is working! Enjoy 1.0.0. Thanks!

___

### Need help? Blue Screen? Missed a step? Need a hug and such?

If you see any issues or errors or need help with a step, please let us know (ASAP!). You can either open an `issue` in this repository or use the [Google Group](https://groups.google.com/forum/#!forum/archipelago-commons). We are here to help.

If you like this, let us know!

## Caring & Coding + Fixing + Testing

* [Diego Pino](https://github.com/DiegoPino)
* [Giancarlo Birello](https://github.com/giancarlobi)
* [Allison Lund](https://github.com/alliomeria)
* [Katie Romabiles](https://github.com/karomabiles)
* [Albert Min](https://github.com/aksm)

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
