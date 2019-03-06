# archipelago-aws-demo
WIP quick Archipelago Skeleton. This repository serves as bootstrap for a Demo Archipelago deployment using minio.io 
as S3 alternative. The skeleton project contains all the pieces needed to run a local deployment of an basic Archipelago except (for now) content.

# Deployment

```Shell
git clone https://github.com/esmero/archipelago-aws-demo.git
git checkout minio
cp docker-compose-minio.yml docker-compose.yml
docker-compose up -d
```
Once all is running 

```Shell
docker exec -ti esmero-web bash -c "composer install;apt-get --yes update;apt-get --yes install mysql-client;composer install;cd web;../vendor/bin/drush -y si --verbose config_installer  config_installer_sync_configure_form.sync_directory=/var/www/html/config/sync/ --db-url=mysql://root:esmerodb@esmero-db/drupal8 --account-name=admin --account-pass=esmero -r=/var/www/html/web --sites-subdir=default --notify=false install_configure_form.enable_update_status_module=NULL install_configure_form.enable_update_status_emails=NULL"
```

