# archipelago-aws-demo

WIP quick Archipelago Skeleton. This repository serves as bootstrap for a Demo Archipelago deployment using minio.io 
as S3 alternative. The skeleton project contains all the pieces needed to run a local deployment of a basic Archipelago except (for now) content.

# Step 1: Deployment

```Shell
git clone https://github.com/esmero/archipelago-aws-demo.git
cd archipelago-aws-demo
git checkout minio
cp docker-compose-minio.yml docker-compose.yml
docker-compose up -d
```

# Step 2: Set up your S3 bucket

Once all containers are up and running

Access localhost:9001
user:minio
pass:minio123
create a bucket named "archipelago"

# Step 3: Deploy Drupal 8

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

Note: About Steps 2-3, you don't need to/nor should do this more than once. You can destroy/stop/update and recreated your Docker containers and start again, `git pull` and your Drupal will persist once you passed `Installation complete` message. All other container's data is persistet inside the "persistent/" folder inside this cloned repository. Drupal and all is code is visible and stable inside your web/ folder.

Optional: create a demo user using drush 
```Shell
docker exec -ti esmero-web bash -c 'drush ucrt demo --password="demo"; drush urol metadata_pro "demo"'
```

Open your most loved Web Browser and point it to http://localhost:8001

See any errors? Let us know.
