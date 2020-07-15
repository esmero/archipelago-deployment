# Adding Demo Archipelago Digital Objects (ADOs) to repository

We make this optional since we feel  not everyone wants to have Digital Objects from other people using space in their system. 
Still, if you are new to Archipelago we encourage you to do this. Its a simply way to get started without thinking too much. 
You can learn and test. Then delete and move over. 

## Prerequisites

### A running Archipelago 1.0-Beta3 or higher.
- You installed it either via the Step by Step [deployment on OSX](docs/osx.md), the one for [ Ubuntu](docs/ubuntu.md) or using your secret powers directly on a VM/Metal/Cloud/EC2 or even a raspberryPI.
- You followed the guides without being too creative which means you have a `jsonapi` drupal user and you can login and out of your server.

## Step 1: Get the content

Go into your `archipelago-deployment` folder and into the `d8content` folder that is inside it. E.g

```Shell
cd archipelago-deployment/d8content
git clone https://github.com/esmero/archipelago-recyclables
```

## Step 2: Ingest the Objects

- If running Docker execute:

```Shell
docker exec -ti esmero-php bash -c 'd8content/archipelago-recyclables/deploy_ados.sh'
```

You will see multiple outputs similar to this

```Shell
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
Gist here is: if the script says `Thanks` you are good.

- If you are not running Docker (You are a unicorn or at least a hacker) you will need to tune/copy/modify the following script:
`archipelago-deployment/d8content/archipelago-recyclables/deploy_ados.sh`

Inside you will find lines like this one 
```Shell
drush archipelago:jsonapi-ingest /var/www/html/d8content/archipelago-recyclables/ado/0c2dc01a-7dc2-48a9-b4fd-3f82331ec803.json --uuid=0c2dc01a-7dc2-48a9-b4fd-3f82331ec803 --bundle=digital_object --uri=http://esmero-web --files=/var/www/html/d8content/archipelago-recyclables/ado/0c2dc01a-7dc2-48a9-b4fd-3f82331ec803 --user=jsonapi --password=jsonapi --moderation_state=published;
```

What you want here is to modify/replace the absolute paths that point your demo objects (.json) and their assets (folders with the same name). Basically replace every entry of `/var/www/html/d8content/archipelago-recyclables/` with the path to `archipelago-recyclables`

### Need help? Blue Screen? Missed a step? Need a hug? Another Hug?
If you have trouble running this or see errors or need help with a step (its only two steps), please let us know (ASAP!). You can either open an `issue` in this repository or use the [Google Group](https://groups.google.com/forum/#!forum/archipelago-commons). We are here to help.

## Caring & Coding + Fixing

* [Diego Pino](https://github.com/DiegoPino)
* [Giancarlo Birello](https://github.com/giancarlobi)

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)

