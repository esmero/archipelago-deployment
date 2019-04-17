# archipelago-aws-demo

WIP quick Archipelago Skeleton. This repository serves as bootstrap for a Demo Archipelago deployment using minio.io 
as S3 alternative. The skeleton project contains all the pieces needed to run a local deployment of a basic Archipelago except (for now) content.

# Starting from CERO

## Step 1: Deployment

```Shell
git clone https://github.com/esmero/archipelago-aws-demo.git
cd archipelago-aws-demo
git checkout minio
cp docker-compose-minio.yml docker-compose.yml
docker-compose up -d
```

## Step 2: Set up your S3 bucket

Once all containers are up and running

Access http://localhost:9000 using your most loved Web Browser

```
user:minio
pass:minio123
```

and create a bucket named "archipelago"

## Step 3: Deploy Drupal 8

run composer inside the esmero-web container to download all dependencies and Drupal core

```Shell
docker exec -ti esmero-web bash -c "composer install"
```
Add the following lines at the end of your `local` web/sites/default/settings.php

```PHP
$settings['s3fs.access_key'] = 'minio';
$settings['s3fs.secret_key'] = 'minio123';
$settings['file_private_path'] = '/var/www/html/private';
ini_set('memory_limit', '512M');
```
Note: We say `local` because your whole Drupal web root (the one you cloned) is also mounted inside the esmero-container. So edits to, e.g PHP files, can be done without accessing the container.

If this is the first time you Deploy Drupal using the provided Configurations run
```Shell
docker exec -ti esmero-web bash -c "apt-get --yes update;apt-get --yes install mysql-client;"
docker exec -ti -u www-data esmero-web bash -c "cd web;../vendor/bin/drush -y si --verbose config_installer  config_installer_sync_configure_form.sync_directory=/var/www/html/config/sync/ --db-url=mysql://root:esmerodb@esmero-db/drupal8 --account-name=admin --account-pass=archipelago -r=/var/www/html/web --sites-subdir=default --notify=false install_configure_form.enable_update_status_module=NULL install_configure_form.enable_update_status_emails=NULL;drush cr"
```

This will give you an admin user with archipelago as password (!change this if running on a public instance!)

Note: About Steps 2-3, you don't need to/nor should do this more than once. You can destroy/stop/update and recreated your Docker containers and start again, `git pull` and your Drupal will persist once you passed `Installation complete` message. All other container's data is persistet inside the "persistent/" folder inside this cloned repository. Drupal and all its code is visible and stable inside your web/ folder.

## Step 4: Optional, create a demo user using drush 
```Shell
docker exec -ti esmero-web bash -c 'drush ucrt demo --password="demo"; drush urol metadata_pro "demo"'
```

Open your most loved Web Browser and point it to http://localhost:8001

See any errors? Let us know.

# Updating an existing Archipelago pulled from here (minio branch)

## Step A

- A. If you made local changes to your content, added files, setup new formatters or changed blocks around means you are amazing and all will be fine. This skeleton project ignores all of that. Skip to [step B](#step-b) 

- B. If you installed new Drupal modules, added new dependencies to composer packages, did some manual docker-compose.yml editing an/or went creative and made mayor changes and you fear you will loose them (yes you could), you are also amazing but you should do the following fist.

Create a new Local Branch and move all your changes to that one. 

```Shell
git stash
git checkout -b minio-mylocalchanges
git stash apply
```

This won't actually commit your changes to the new branch but the changes will be there for you to decide how to deal with them. You could do a `git commit -am "All my changes in single commit"` to make sure they persist. Not saying making a single commit for 2999 file changes is the way! Just that it is "a" way.

This will preserve your local changes in that branch. 

## Step B

```Shell
git checkout minio
git pull
```

Look at the output of that command and look for larger changes? Did you loose a file? Depending on when you did the last `git pull` a file that could got lost is `docker-compose.yml`. We recently (to avoid you having to do this) added it to `.gitignore`. But if your `.gitignore` still has no entry for it, you will loose it. No harm really since you are trying to keep your vanilla docker deployment in shape here. If it was removed (sorry) do.

```Shell
cp docker-compose-minio.yml docker-compose.yml
```

It was always a copy, so doing that will keep your docker-compose working as before.

If your `docker-compose.yml` was highly customized, fancy and totally diverging from the original here we think its better to manage a paralell branch for that and manually bring the changes back. You can see your previous docker-compose.yml inside your new `minio-mylocalchanges` branch or reset the current to a previous commit hash if needed. (`git log` is your friend)

## Step C

Now make Drupal/compose aware of the updates you pulled

```Shell
docker exec -ti esmero-web bash -c "composer install"
```

That last command will use the updated `composer.lock` file to download/use exactly the same package versions and dependencies we have tested during development. Just in case and to see Archipelago is still in shape, clear your Drupal caches

```Shell
docker exec -ti esmero-web bash -c "drush cr"
```

And done!

## Step D

Did you say yes to step A, letter A)? Means you downloaded and enabled custom packages. That also means that those additions are no longer referenced in your composer.json file and because of that they can not be updated anymore (the actual packages will still be there in your `vendor` folder so at least your Archipelago will keep working). To be able to keep managing them via `composer` you will have to manually add them. We really recommend that if that will be your development strategy you either suggest (open an issue here) that we add those extras to the main repo, explaining how and why there are needed (we tried to curate modules based on activity, quality of code and how badly we needed them) or, you can keep a paralell branch like `minio-mylocalchanges` and merge there into that changes pulled from `minio` . Changes between those two branches can be seen by doing

```Shell
git diff minio-local minio
```
