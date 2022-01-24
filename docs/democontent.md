<!--documentation
---
title: "Adding Demo Archipelago Digital Objects (ADOs) to your Repository"
tags:
  - Archipelago Digital Objects
  - Demo Content
---
documentation-->

# Adding Demo Archipelago Digital Objects (ADOs) to your Repository

We make this optional since we feel  not everyone wants to have Digital Objects from other people using space in their system. 
Still, if you are new to Archipelago we encourage you to do this. Its a simply way to get started without thinking too much. 
You can learn and test. Then delete and move over. 

## Prerequisites

### The new way Archipelago 1.0.0-RC2 or higher.

- You installed it either via the Step by Step [deployment on OSX](osx.md), the one for [Ubuntu](ubuntu.md) or using your secret powers directly on a VM/Metal/Cloud/EC2 or even a raspberryPI.
- You followed the guides without being too creative which means you have an `jsonapi` drupal user and an `admin` one and you can login and out of your server.
- You remember your `admin`user

## Step 1: (only step)

- Log into your Archipelago using the `admin` user. 
- Navigate to `Content` -> `Ami Sets`. You will see a single `AMI Set` already in place. 
- On the Drop Down Menu to the right (The `edit` Button), press on the little `down arrow` and choose `Process`. 
- A new Form will appear. Under `DESIRED ADOS STATUSES AFTER PROCESS`, change all from Draft to Published, leave `Enqueue but do not process Batch in realtime` unchecked and press "Confirm". The Ingest will start and a progress bar will advance. Once ready a list of Ingest Objects should appear.
- You are done!

### Old way, A running Archipelago 1.0-Beta3 or higher.

- You installed it either via the Step by Step [deployment on OSX](osx.md), the one for [Ubuntu](ubuntu.md) or using your secret powers directly on a VM/Metal/Cloud/EC2 or even a raspberryPI.
- You followed the guides without being too creative which means you have a `jsonapi` drupal user and you can login and out of your server.

## Step 1: Get the content

Go into your `archipelago-deployment` folder and into the `d8content` folder that is inside it, e.g.

```shell
cd archipelago-deployment/d8content
git clone https://github.com/esmero/archipelago-recyclables
```

## Step 2: Ingest the Objects

- If running Docker execute:

```shell
docker exec -ti esmero-php bash -c 'd8content/archipelago-recyclables/deploy_ados.sh'
```

You will see multiple outputs similar to this:

```shell
Files in provided location:
 - anne_001.jpg
 - anne_002.jpg
 - anne_003.jpg
 - anne_004.jpg
 - anne_005.jpg
 - anne_006.jpg
 - anne_007.jpg
 - anne_008.jpg
 - anne_009.jpg
 - anne_010.jpg
File anne_001.jpg sucessfully uploaded with Internal Drupal file ID 5
File anne_002.jpg sucessfully uploaded with Internal Drupal file ID 6 
File anne_003.jpg sucessfully uploaded with Internal Drupal file ID 7
File anne_004.jpg sucessfully uploaded with Internal Drupal file ID 8
File anne_005.jpg sucessfully uploaded with Internal Drupal file ID 9 
File anne_006.jpg sucessfully uploaded with Internal Drupal file ID 10 
File anne_007.jpg sucessfully uploaded with Internal Drupal file ID 11 
File anne_008.jpg sucessfully uploaded with Internal Drupal file ID 12
File anne_009.jpg sucessfully uploaded with Internal Drupal file ID 13 
File anne_010.jpg sucessfully uploaded with Internal Drupal file ID 14
New Object 'Anne of Green Gables : Chapters 1 and 2' with UUID 9eb28775-d73a-4904-bc79-f0e925075bc5 successfully ingested. Thanks!
```

The gist here is that if the script says `Thanks` you are good.

- If you are not running Docker (You are a unicorn or at least a hacker) you will need to tune/copy/modify the following script:
`archipelago-deployment/d8content/archipelago-recyclables/deploy_ados.sh`

Inside you will find lines like this one: 

```shell
drush archipelago:jsonapi-ingest /var/www/html/d8content/archipelago-recyclables/ado/0c2dc01a-7dc2-48a9-b4fd-3f82331ec803.json --uuid=0c2dc01a-7dc2-48a9-b4fd-3f82331ec803 --bundle=digital_object --uri=http://esmero-web --files=/var/www/html/d8content/archipelago-recyclables/ado/0c2dc01a-7dc2-48a9-b4fd-3f82331ec803 --user=jsonapi --password=jsonapi --moderation_state=published;
```

What you want here is to modify/replace the absolute paths that point your demo objects (.json) and their assets (folders with the same name). Basically replace every entry of `/var/www/html/d8content/archipelago-recyclables/` with the path to `archipelago-recyclables`.

### Need help? Blue Screen? Missed a step? Need a hug? Another Hug?

If you have trouble running this or see errors or need help with a step (its only two steps), please let us know (ASAP!). You can either open an `issue` in this repository or use the [Google Group](https://groups.google.com/forum/#!forum/archipelago-commons). We are here to help.

## Caring & Coding + Fixing

* [Diego Pino](https://github.com/DiegoPino)
* [Giancarlo Birello](https://github.com/giancarlobi)
* [Allison Lund](https://github.com/alliomeria)
* [Albert Min](https://github.com/aksm)

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
