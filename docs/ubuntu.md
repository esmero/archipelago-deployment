<!--documentation
---
title: "Installing Archipelago Drupal 9 on Ubuntu 18.04 or 20.04"
tags:
  - Archipelago-deployment
  - Drupal 9
  - Ubuntu 18.04
  - Ubuntu 20.04
---
documentation-->

# Installing Archipelago Drupal 9 on Ubuntu 18.04 or 20.04

## About running terminal commands

This guide assumes you are comfortable enough running terminal (bash) commands on a Linux Computer.

We made sure that you can `copy` and `paste` each of these commands from this guide directly into your terminal.

You will notice sometimes commands **span more than a single line** of text. If that is the case, always make sure you copy and paste **a single line at a time** and press the `Enter` key afterwards. We suggest you also look at the output.

If something fails (and we hope it does not) troubleshooting will be much easier if you can share that output when asking for help.

Happy deploying!

## Prerequisites

- At least 10 Gbytes of free space (to get started)
- Some basic Unix/Terminal Skills
- 2-4 Gbytes of RAM (4 Recommended)
- Install Docker if you don't have it already by running:

```shell
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt-cache policy docker-ce
sudo apt install docker-ce
sudo systemctl status docker

sudo usermod -aG docker ${USER}
```

Log out, and log in again!

```shell
sudo apt install docker-compose
```

Git tools are included by default in Ubuntu.

### Wait! Question: Do you have a previous version of Archipelago running?

If so, let's give that hard working repository a break first. If not, [Step 1](#step-1-deployment):

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

Now we need to remove them so we run the following:

```shell
docker rm esmero-web
docker rm esmero-solr
docker rm esmero-db
docker rm esmero-cantaloupe
docker rm esmero-php
docker rm esmero-minio
```

Ok, now we are ready to start.

## Step 1: Deployment

##### Prefer to watch a video to see what it's like to install? Go to our [`user contributed documentation`](#user-contributed-documentation-a-video1)[^1]!

#### IMPORTANT

If you run `docker-compose` as root user (using `sudo`) some enviromental variables, like the current folder used inside the `docker-compose.yml` to mount the Volumes, will not work and you will see a bunch of errors.

There are two possible solutions.

- The best is to add your [user to the docker group](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04) (so no `sudo` needed).
- The second option is to replace every `{$PWD}` inside your `docker-compose.yml` with either the full path to your current folder, or with a `.` and wrap that whole line in double quotes, basically making the paths for volumes relatives.

Instead of: `- ${PWD}:/var/www/html:cached`
use: `- ".:/var/www/html:cached"`

Now that you got it, let's deploy:

```shell
git clone https://github.com/esmero/archipelago-deployment.git archipelago-deployment
cd archipelago-deployment
git checkout 1.0.0-RC3
```

And now a hard choice. Which docker-compose/ensemble? Edge? Stable? Legacy? So many choices. For latest/modern stack PHP7.4/Solr8.8/MySQL8 we recommend:

```shell
cp docker-compose-linux.yml docker-compose.yml
docker-compose pull
docker-compose up -d
```

You have something running and do not want to update Databases/Solr indexes: Go legacy. In doubt? Ask us please. We can help.

If you want to stay more traditional and stick with older versions PHP7.4/Solr7.5/MySQL57 we recommend the following:

```shell
cp docker-compose-legacy.yml docker-compose.yml
docker-compose pull
docker-compose up -d
```

Note: `docker-compose.yml` is git ignored in case you make local adjustments or changes to it.

You need to make sure Docker can read/write to your local Drive, a.k.a mounted volumes (especially if you decided not to run it as `root` because we told you so!).

This means in practice running:

```shell
sudo chown -R 100:100 persistent/iiifcache
sudo chown -R 8983:8983 persistent/solrcore
```

And then:

```shell
docker exec -ti esmero-php bash -c "chown -R www-data:www-data private"
```

*Question:* Why is this last command different? Answer: Just a variation. The long answer is that the internal `www-data` user in that container (Alpine Linux) has uid:82, but on Ubuntu the `www-data` user has a different one so we let Docker assign the uid from inside instead. In practice you could also run directly `sudo chown -R 82:82 private` which would only apply to an Alpine use case, which can differ in the future! Does this make sense? No worries if not.

## Step 2: Set up your Minio S3 bucket

Once all containers are up and running (you can do a `docker ps` to check),
access `http://localhost:9001` using your most loved Web Browser with the following credentials:

```shell
user:minio
pass:minio123
```

and create a bucket named "archipelago". To do so go to the `Buckets` section in the navigation pane, and click `Create Bucket +`. Type `archipelago` under `Bucket Name` and submit, done! That is where we will persist all your Files and also your File copies of each Digital Object. You can always go there and explore what Archipelago (well really Strawberryfield does the hard work) has persisted so you can get comfortable with our architecture.

## Step 3: Deploy Drupal 9.2.9 and the awesome Archipelago Modules

The following will run composer inside the esmero-php container to download all dependencies and Drupal Core too.

```shell
docker exec -ti esmero-php bash -c "composer install"
```

You will see a warning: `Do not run Composer as root/super user! See https://getcomposer.org/root for details` and the a long list of PHP packages. Don't worry. All is good here. Keep following the instructions! Once that command finishes run our setup script:

```shell
docker exec -ti esmero-php bash -c 'scripts/archipelago/setup.sh'
```

Explanation: That script will append some important configurations to your local `web/sites/default/settings.php`.

Note: We say `local` because your whole Drupal web root (the one you cloned) is also mounted inside the esmero-php and esmero-web containers. So edits to PHP files, for example, can be done without accessing the container directly from your local folder.

If this is the first time you're deploying Drupal using the provided Configurations run:

```shell
docker exec -ti -u www-data esmero-php bash -c "cd web;../vendor/bin/drush -y si --verbose --existing-config --db-url=mysql://root:esmerodb@esmero-db/drupal9 --account-name=admin --account-pass=archipelago -r=/var/www/html/web --sites-subdir=default --notify=false;drush cr;chown -R www-data:www-data sites;"
```

This will give you an `admin` Drupal user with `archipelago` as password (change this if running on a public instance!) and also set the right Docker Container owner for your Drupal installation files.

Note about Steps 2-3: You don't need to, nor should you do this more than once. You can destroy/stop/update, recreate your Docker containers, and start again (`git pull`), and your Drupal and Data will persist once you've passed the `Installation complete` message. I repeat, all other containers' data is persisted inside the `persistent/` folder contained in this cloned git repository. Drupal and all its code is visible, editable, and stable inside your `web/` folder.

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

You are done! Open your most loved Web Browser and point it to `http://localhost:8001`

Note: It can take some time to start the first time (Drupal needs some warming up). The Ubuntu deployment is WAY faster than the OSX deployment because of the way the bind mount volumes are handled by the driver. Our experience is that Archipelago basically reacts instantly!

### Need help? Blue Screen? Missed a step? Need a hug?

If you see any issues or errors or need help with a step, please let us know (ASAP!). You can either open an `issue` in this repository or use the [Google Group](https://groups.google.com/forum/#!forum/archipelago-commons). We are here to help.

If you like this, let us know!

### User contributed documentation (A Video!)[^1]:

_Installing Archipelago on AWS Ubuntu_ by [Zach Spalding](https://github.com/senyzspalding): <https://youtu.be/RBy7UMxSmyQ>

[^1]: You may find this user contributed tutorial video, which was created for an earlier Archipelago release, to be helpful. Please note that there are significant differences between the executed steps and that you need to follow the current release instructions in order to have a successful deployment.

## Caring & Coding + Fixing + Testing

* [Diego Pino](https://github.com/DiegoPino)
* [Giancarlo Birello](https://github.com/giancarlobi)
* [Allison Lund](https://github.com/alliomeria)
* [Albert Min](https://github.com/aksm)

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
