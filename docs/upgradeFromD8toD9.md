# Archipelago-deployment: upgrading Drupal 8 to Drupal 9

## What is this documentation for?

If you already have a well set up and well loved Archipelago (RC2 or your own custom version) running Drupal 8 (D8), this documentation will allow you to update to Drupal 9 (D9) without major issues.

D8 will no longer be supported by the end of November 2021. D9 has been around for a little while, and even if every module is not supported yet, what you need and want for **Archipelago** has long been ready for D9.

## Requirements

- A live instance (working, tested) of Archipelago via Docker running Drupal 8
- Basic knowledge and instincts on how to run Terminal Commands, `composer` and `drush`
- Patience. You can't skip steps here.
- For Shell Commands documented here please copy line by line. Not the whole block.

## Backing up

Backups are always going to be your best friends. Archipelago's code, database, and settings are mostly self-contained in your current `archipelago-deployment` repo folder, and backing up is simple because of that.

### Step 1:

Shutdown your `docker-compose` ensemble. Move to your `archipelago-deployment` folder and run this:

```Shell
docker-compose down
```

### Step 2:

Verify all containers are actually down. The following command should return an empty listing. If anything is still running, wait a little longer and run the following comman again.

```Shell
docker ps
```

### Step 3:

Now let's tar.gz the whole ensemble with data and configs. As an example we will save this into your `$HOME` folder. 
As a good practice we append the **current date **(YEAR-DAY-MONTH) to the filename. Here we assume today is September 1st of 2021.

```Shell
sudo tar -czvpf $HOME/archipelago-deployment-backup-20210109.tar.gz ../archipelago-deployment
```

The process may take a few minutes. Now let's verify all is there and the `tar.gz` is not corrupt.

```Shell
tar -tvvf $HOME/archipelago-deployment-backup-20210109.tar.gz 
```

You will see a listing of files. If corrupt (do you have enough space? did your ssh connection drop?) you will see:

```Shell
tar: Unrecognized archive format
```

### Step 4:

Restart your `docker-compose` ensemble and wait a little while for all to start. Newer versions of Minio may take up to 4 minutes to connect if you are using it as an AWS S3 Gateway.

```Shell
docker-compose up -d
```

## Upgrading

### Step 1:

Navigate to your current `archipelago-deployment` repo folder and open up the file `permissions` for some of your most protected Drupal files.

```Shell
sudo chmod 777 web/sites/default
sudo chmod 666 web/sites/default/*settings.php
sudo chmod 666 web/sites/default/*services.yml
```

### Step 2:

We are going to tell `composer` to update `composer.json` requirements *but not* update yet all dependencies (means also your Drupal 8 is running this whole time without being affected, nice!). This is very important to avoid dead-locks of cross-dependant libraries.

Run each line for D9 core and its base packages.

```Shell
docker exec -ti esmero-php bash -c "composer require drupal/core:^9 drupal/core-composer-scaffold:^9 drupal/core-project-message:^9 --update-with-dependencies --no-update"
docker exec -ti esmero-php bash -c "composer require drupal/core-dev:^9 --update-with-dependencies --no-update"
```

Now we are going to update D8 Archipelago required and suggested modules into D9 requirements/compatible packages:

```Shell
docker exec -ti esmero-php bash -c "composer require drupal/form_mode_manager:^2.0@RC --update-with-dependencies --no-update"
docker exec -ti esmero-php bash -c "composer require drupal/display_field_copy:^2.0 --update-with-dependencies --no-update"
docker exec -ti esmero-php bash -c "composer require symfony/event-dispatcher:^4 --update-with-dependencies --no-update"
docker exec -ti esmero-php bash -c "composer require symfony/yaml:^4  --update-with-dependencies --no-update"
docker exec -ti esmero-php bash -c "composer require drupal/webform:^6  --update-with-dependencies --no-update"
docker exec -ti esmero-php bash -c "composer require drupal/google_api_client:3.2 --update-with-dependencies --no-update"
docker exec -ti esmero-php bash -c "composer require drupal/bootstrap_barrio:5.1 --update-with-dependencies --no-update"
docker exec -ti esmero-php bash -c "composer require 'drupal/role_theme_switcher:^1.1'' --update-with-dependencies --no-update"
```

*Note:* We are fixing `drupal/bootstrap_barrio` to an exact version (5.1) because 5.5 and later are now Bootstrap 5 and `archipelago_subtheme` is still Bootstrap 4. 

We need to also remove legacy modules that are **no longer supported** by D9 or have been incorporated into `Core`. 

```Shell
docker exec -ti esmero-php bash -c "composer remove drupal/config_installer  --update-with-dependencies --no-update"
docker exec -ti esmero-php bash -c "composer remove drupal/jsonapi_earlyrendering_workaround --no-update"
docker exec -ti esmero-php bash -c "composer remove drupal/markdown --no-update"
docker exec -ti esmero-php bash -c "composer remove drupal/module_missing_message_fixer --no-update "
docker exec -ti esmero-php bash -c "composer remove drupal/key_value --no-update"
docker exec -ti esmero-php bash -c "composer remove drupal/olivero --no-update"
```

And we uninstall those from Drupal too (IMPORTANT)

```Shell
docker exec -ti esmero-php bash -c " drush pm-uninstall module_missing_message_fixer"
docker exec -ti esmero-php bash -c " drush pm-uninstall jsonapi_earlyrendering_workaround"
docker exec -ti esmero-php bash -c " drush pm-uninstall markdown"
docker exec -ti esmero-php bash -c " drush pm-uninstall webprofiler"
docker exec -ti esmero-php bash -c " drush pm-uninstall key_value"
```

*Note:* If we happened to remove via `composer` a module without using `--no-update` then the `drush pm-uninstall` would totally fail and many other things will become weird! NEVER do that. You can always `drush pm-uninstall` first in the future if you are not going to remember to use `--no-update`, just to be double safe.

### Step 3:

Finally! Now we are going to tell `composer` to actually fetch the NEW code and update its dependencies.

```Shell
docker exec -ti esmero-php bash -c "composer update -W"
```

During this process you may see a message like this because of applied patches during Archipelago D8 installation. Select 'y' and press enter.

```Shell
 - Upgrading drupal/fancy_file_delete (2.0.3 => 2.0.5): Extracting archive
    drupal/form_mode_manager has modified files:
    M src/AbstractEntityFormModesFactory.php
    M src/Controller/FormModeManagerEntityController.php
    Discard changes [y,n,v,d,s,?]? y
```  
  
If you see **no** issues and all ends in a **Green colored message** all is good!  (Jump to Step 4)


#### What if not all is OK and I see red and a lot of dependency explanations?

If you have manually installed packages via composer in the past that are NO longer Drupal 9 compatible you may see errors. 
In that case you need to check each package website's (normally https://www.drupal.org/project/the_module_name) and check if there is a Drupal 9 compatible version. 

If so run:

```Shell
docker exec -ti esmero-php bash -c "composer require 'drupal/the_module_name:^VERSION_NUMBER_THAT_WORKS_ON_DRUPAL9_' --update-with-dependencies --no-update" and run **Step 3 ** again (and again until all is cleared)
```

If not: try to find a replacement module that does something simular, but in any case you may end having to remove before proceding. Give us a ping/slack/google group/open a github ISSUE if you find yourself uncertain about this. 

```Shell
docker exec -ti esmero-php bash -c "composer remove drupal/the_module_name --no-update"
docker exec -ti esmero-php bash -c " drush pm-uninstall the_module_name"
```

### Step 4:

We will now ask Drupal to update its internal Configs and databases and enable a few last minute modules. In case for some odd dependecy issue you end up running an older version of D9, the following commands will bring you up to date.

 ```Shell  
docker exec -ti esmero-php bash -c "drush updatedb"
docker exec -ti esmero-php bash -c "composer require drupal/core:^9.2 drupal/core-dev:^9.2 -W"
docker exec -ti esmero-php bash -c "composer require drupal/jquery_ui drupal/jquery_ui_datepicker"
docker exec -ti esmero-php bash -c "drush en jquery_ui jquery_ui_datepicker"
```

And yet another update pass!

```Shell
docker exec -ti esmero-php bash -c "composer update -W"
docker exec -ti esmero-php bash -c "drush updatedb"
```

### Step 5:

Good! If you made it this far you are almost ready (are we ever ready?). Now to restore permissions for your important protected Drupal files, and  then you should be ready to (hopefully) stay in the Drupal 9 realm for a few years!

```Shell
sudo chmod 755 web/sites/default
sudo chmod 644 web/sites/default/*settings.php
sudo chmod 644 web/sites/default/*services.yml
```

Please log into your Archipelago and test/check all is working. Your Configurations will have changed (the .yml files) so it's a good moment to get yourself a package of those and after checking them you can export them.

Type to get all the options. 

```Shell
docker exec -ti esmero-php bash -c "drush cex --help"
```

If you run this comman directly it will overwrite your `config/sync` folder, so it may be a good idea to double check OR if you are keeping `configs` in an alternate folder to add the `--destination[=DESTINATION]` flag to the command at the end.

```Shell
docker exec -ti esmero-php bash -c "drush cex"
```
___

Thank you for reading! Please contact us on our [Archipelago Commons Google Group](https://groups.google.com/forum/#!forum/archipelago-commons) with any questions or feedback, or open an ISSUE in this [Archipelago Deployment Repository](https://github.com/esmero/archipelago-deployment/).

Return to [Archipelago Deployment](../README.md).
