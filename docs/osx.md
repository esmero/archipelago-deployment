# Installing Archipelago on OSX

## Prerequisites

### OSX: 
- [Install Docker for Mac](https://docs.docker.com/docker-for-mac/)
- [Instal Github Desktop](https://desktop.github.com)
- At least 10 Gbytes of free space (to get started)
- Open a terminal

### Wait! Question: Do you have a previous version of Archipelago running? 

If so, let's give that hard working repository a break first. If not, skip to [Step 1](#step-1-docker-deployment):

- Open a terminal (you have that already right?) and go to your previous download/git clone folder and run:

```Shell
docker-compose rm
```

- Can't remember where you downloaded it? Ok. We can deal with that!

Let's stop the containers gracefully first, run: 

```Shell
docker stop esmero-web
docker stop esmero-solr
docker stop esmero-db
docker stop esmero-cantaloupe
```

Now we need to remove them, run:

```Shell
docker rm esmero-web
docker rm esmero-solr
docker rm esmero-db
docker rm esmero-cantaloupe
```

Ok, now we are ready to start.

## Step 1: Docker Deployment

```Shell
git clone https://github.com/esmero/archipelago-deployment.git archipelago-deployment
cd archipelago-deployment
git checkout 8.x-1.0-beta1
docker-compose up -d
```

## Step 2: Set up your Minio S3 bucket

Once all containers are up and running (you can do a `docker ps` to check),
access `http://localhost:9000` using your most loved Web Browser with the following credentials:

```
user:minio
pass:minio123
```

and create a bucket named "archipelago". To do so press the yellow `+` button on the bottom-right side and press the `Bucket` icon , it has a tooltip that says "create bucket". Write `archipelago` and submit, done! That is where we will persist all your Files and also your File copies of each Digital Object. You can always go there and explore what Archipelago (well really Strawberryfield does the hard work) has persisted so you can get comfortable with our architecture.

## Step 3: Deploy Drupal 8.7.5 and the awesome Archipelago Modules

The following will run composer inside the esmero-php container to download all dependencies and Drupal Core too.

```Shell
docker exec -ti esmero-php bash -c "composer install"
```
Once that command finishes run our setup script:

```Shell
docker exec -ti esmero-php bash -c 'scripts/archipelago/setup.sh'
```

Explanation: That script will append some important configurations to your local `web/sites/default/settings.php`.

Note: We say `local` because your whole Drupal web root (the one you cloned) is also mounted inside the esmero-php and esmero-web containers. So edits to, e.g PHP files, can be done without accessing the container directly from your local folder.

If this is the first time you Deploy Drupal using the provided Configurations run:

```Shell
docker exec -ti -u www-data esmero-php bash -c "cd web;../vendor/bin/drush -y si --verbose config_installer  config_installer_sync_configure_form.sync_directory=/var/www/html/config/sync/ --db-url=mysql://root:esmerodb@esmero-db/drupal8 --account-name=admin --account-pass=archipelago -r=/var/www/html/web --sites-subdir=default --notify=false install_configure_form.enable_update_status_module=NULL install_configure_form.enable_update_status_emails=NULL;drush cr"
```

This will give you an `admin` Drupal user with `archipelago` as password (!change this if running on a public instance!)

Note: About Steps 2-3, you don't need to/nor should do this more than once. You can destroy/stop/update and recreated your Docker containers and start again, `git pull` and your Drupal and Data will persist once you passed `Installation complete` message. I repeat, all other container's data is persistet inside the `persistent/` folder contained in this cloned git repository. Drupal and all its code is visible, editable and stable inside your `web/` folder.

## Step 4: Create a "demo "and a "jsonapi" user using drush 
```Shell
docker exec -ti esmero-web bash -c 'drush ucrt demo --password="demo"; drush urol metadata_pro "demo"'
docker exec -ti esmero-web bash -c 'drush ucrt jsonapi --password="jsonapi"; drush urol metadata_pro "jsonapi"'
```

## Step 5: Ingest some Metadata Displays to make playing much more interactive

Archipelago is more fun without having to start writing Metadata Displays (in Twig) before you know what they actually are. Since you should now have a `jsonapi` user and jsonapi should be enabled, you can use that awesome functionality of D8 to get that done. We have 4 demo Metadata Display Entities that go well with the demo Webform we provided. To do that execute in your shell (copy and paste)

```Shell
docker exec -ti esmero-php bash -c 'scripts/archipelago/deploys.sh'
```
Open your most loved Web Browser and point it to http://localhost:8001
Note: It can take some time to start the first time (Drupal needs some warming up). Also, to make this docker-compose easier to use we are doing something named bind mounting your folders. Good thing is you can edit files in your machine and they get updated instantly to docker. bad thing, it runs slower than on Linux. Speed is a huge factor here, but, you get the flexibility of changing, backing up and persisting files without having a Docker University Degree.

### Need help? Blue Screen? Missed a step? Need a hug?
If you see any issues or errors or need help with a step, please let us know (ASAP!). You can either open an `issue` in this repository or use the [Google Group](https://groups.google.com/forum/#!forum/archipelago-commons). We are here to help.

This is our first beta release and even when we have a longer Path to travel until we feel we are ready for a full `8.x-1.0`, we are pretty excited about how far we have gotten in less than a year. If you like this, let us know.

## Caring & Coding + Fixing

* [Diego Pino](https://github.com/DiegoPino)
* [Giancarlo Birello](https://github.com/giancarlobi)

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)


