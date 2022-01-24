<!--documentation
---
title: "Installing Archipelago Drupal 9 on OSX (macOS)"
tags:
  - Archipelago-deployment
  - Drupal 9
  - macOS
  - OSX
---
documentation-->

# Installing Archipelago Drupal 9 on OSX (macOS)

## About running terminal commands

This guide assumes you are comfortable enough running terminal (bash) commands on an OSX Computer.

We made sure that you can `copy` and `paste` each of these commands from this guide directly into your terminal.

You will notice sometimes commands **span more than a single line** of text. If that is the case, always make sure you copy and paste **a single line at a time** and press the `Enter` key afterwards. We suggest also you look at the output.

If something fails (and we hope it does not) troubleshooting will be much easier if you can share that output when asking for help.

Happy deploying!

### OSX (macOS):

- [Install Docker for Mac](https://docs.docker.com/docker-for-mac/)
  - For OSX (macOS) `Catalina` or `Big Sur` on Intel (i5/i7) the tested version is: `4.0.1(68347)`. You may go newer of course.
  - For `Big Sur` and `Apple Silicon M1` Chips please read <https://docs.docker.com/docker-for-mac/apple-silicon/>. You may need to enable manual compatibility mode in your `docker-compose.yml` file for the `esmero-php` and `esmero-cantaloupe` containers.
  - In `Preferences` -> `General`: check `Use gRPC FUSE for file sharing` and restart. Specially if you are using your `$HOME` folder for deploying, e.g. `/Users/username`.
  - In `Preferences` -> `Resources`: 4 Gbytes of RAM is the recommended minimun and works; 8 Gbytes is faster and snappier.
- [Install Github Desktop](https://desktop.github.com).
- At least 10 Gbytes of free space (to get started).
- Being able to open a terminal.

**Note:** Recent OSX (macOS) and newer Macs ship with **2 annoying things**: Apple Cloud Syncing User Folders and (wait for it) Case insensitive File Systems. If you are happy with your shiny new Mac (like i was) we are aware that it's better to deploy anything mounted outside of the `/User` folder or even better, in an **external drive formatted using a Case Sensitive Unix Filesystem** (Mac OS Extended (Case-sensitive, Journaled)).

**Note 2:** "Use gRPC FUSE for file sharing" experience may vary, recent Docker for Mac does it well. In older RC1 ones it was evil. Changing/Disabling it after having installed Archipelago may affect your S3/Minio storage accessibility. Please let us know what your experience on this is.

### Wait! Question: Do you have a previous version of Archipelago running?

If so, let's give that hard working repository a break first. If not, skip to [Step 1](#step-1-docker-deployment):

- Open a terminal (you have that already right?) and go to your previous download/git clone folder and run:

```shell
docker-compose down
docker-compose rm
```

- Can't remember where you downloaded it? Ok. We can deal with that!

Let's stop the containers gracefully first, run:

```shell
docker stop esmero-web
docker stop esmero-solr
docker stop esmero-db
docker stop esmero-cantaloupe
docker stop esmero-php
docker stop esmero-minio
```

Now we need to remove them, run:

```shell
docker rm esmero-web
docker rm esmero-solr
docker rm esmero-db
docker rm esmero-cantaloupe
docker rm esmero-php
docker rm esmero-minio
```

Ok, now we are ready to start. Depending on what type of Chip your Apple uses you have two options:

## Step 1 (Intel): Docker Deployment on Intel Chips Apple Machines

```shell
git clone https://github.com/esmero/archipelago-deployment.git archipelago-deployment
cd archipelago-deployment
git checkout 1.0.0-RC3
cp docker-compose-osx.yml docker-compose.yml
docker-compose pull
docker-compose up -d
```

## Step 1 (M1): Docker Deployment on Apple Silicon Chips (M1)

```shell
git clone https://github.com/esmero/archipelago-deployment.git archipelago-deployment
cd archipelago-deployment
git checkout 1.0.0-RC3
cp docker-compose-arm64.yml docker-compose.yml
docker-compose pull
docker-compose up -d
```

Note: If you are running on an Intel Apple Machine from an external Drive or a partition/filesystem that is `Case Sensitive` and is not syncing automatically to `Apple Cloud` you can also use `docker-compose-linux.yml`.
Note2: `docker-compose.yml` is git ignored in case you make local adjustments or changes to it.

## Step 2: Set up your Minio S3 bucket

Once all containers are up and running (you can do a `docker ps` to check), access the minio console at `http://localhost:9001` using your most loved Web Browser with the following credentials:

```
user:minio
pass:minio123
```

and once logged in, press on "Buckets" (left tools column) and then on "Create Bucket"  (top right) and under "Bucket Name" type `archipelago`. Leave all other options unchecked for now (you can experiment with those later), and make sure you write `archipelago` (no spaces, lowercase) and press "Save". Done! That is where we will persist all your Files and also your File copies of each Digital Object. You can always go there and explore what Archipelago (well really Strawberryfield does the hard work) has persisted so you can get comfortable with our architecture.

## Step 3: Deploy Drupal 9.2.9 and the awesome Archipelago Modules

The following will run composer inside the esmero-php container to download all dependencies and Drupal Core too:

```shell
docker exec -ti esmero-php bash -c "composer install"
```

Once that command finishes run our setup script:

```shell
docker exec -ti esmero-php bash -c 'scripts/archipelago/setup.sh'
```

Explanation: That script will append some important configurations to your local `web/sites/default/settings.php`.

Note: We say `local` because your whole Drupal web root (the one you cloned) is also mounted inside the esmero-php and esmero-web containers. So edits to PHP files, for example, can be done without accessing the container directly from your local folder.

If this is the first time you deploy Drupal using the provided Configurations run:

```shell
docker exec -ti -u www-data esmero-php bash -c "cd web;../vendor/bin/drush -y si --verbose --existing-config --db-url=mysql://root:esmerodb@esmero-db/drupal9 --account-name=admin --account-pass=archipelago -r=/var/www/html/web --sites-subdir=default --notify=false;drush cr;chown -R www-data:www-data sites;"
```

Note: You will see this warning: `[warning] The "block_content:1cdf7155-eb60-4f27-9e5e-64fffe93127a" was not found`. Nothing to worry about. We will provide the missing part in Step 5.

This will give you an `admin` Drupal user with `archipelago` as password (Change this if running on a public instance!).

Note about Steps 2-3: You don't need to, nor should you do this more than once. You can destroy/stop/update, recreate your Docker containers, and start again (`git pull`), and your Drupal and Data will persist once you're past the `Installation complete` message. I repeat, all other containers' data is persisted inside the `persistent/` folder contained in this cloned git repository. Drupal and all its code is visible, editable, and stable inside your `web/` folder.

## Step 4: Create a "demo "and a "jsonapi" user using drush and assign your "admin" user the Administrator Role (new for Drupal 9).

```shell
docker exec -ti esmero-php bash -c 'drush ucrt demo --password="demo"; drush urol metadata_pro "demo"'
docker exec -ti esmero-php bash -c 'drush ucrt jsonapi --password="jsonapi"; drush urol metadata_api "jsonapi"'
docker exec -ti esmero-php bash -c 'drush urol administrator "admin"'
```

## Step 5: Ingest some Metadata Displays to make playing much more interactive

Archipelago is more fun without having to start writing Metadata Displays (in Twig) before you know what they actually are. Since you should now have a `jsonapi` user and jsonapi should be enabled, you can use that awesome functionality of D8 to get that done. We have 4 demo Metadata Display Entities that go well with the demo Webform we provided. To do that execute in your shell (copy and paste):

```shell
docker exec -ti esmero-php bash -c 'scripts/archipelago/deploy.sh'
```

Open your most loved Web Browser and point it to `http://localhost:8001`.

Note: It can take some time to start the first time (Drupal needs some warming up).

Also, to make this docker-compose easier to use we are doing something named `bind mounting` (or similar...) your folders. The good thing is that you can edit files in your machine, and they get updated instantly to docker. The bad thing is that the OSX (macOS) driver runs slower than on Linux. Speed is a huge factor here, but you get the flexibility of changing, backing up, and persisting files without needing a Docker University Degree.

### Need help? Blue Screen? Missed a step? Need a hug and such?

If you see any issues or errors or need help with a step, please let us know (ASAP!). You can either open an `issue` in this repository or use the [Google Group](https://groups.google.com/forum/#!forum/archipelago-commons). We are here to help.

If you like this, let us know!

## Caring & Coding + Fixing + Testing

* [Diego Pino](https://github.com/DiegoPino)
* [Giancarlo Birello](https://github.com/giancarlobi)
* [Allison Lund](https://github.com/alliomeria)
* [Albert Min](https://github.com/aksm)

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
