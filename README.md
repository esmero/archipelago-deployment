# Archipelago Docker Deployment

**Updated:** July 15th 2020 (Seventh year of the dark century known as 2020. All this during pandemic times)

This repository serves as bootstrap for a Archipelago 8.x-1.0-beta3 deployment via Docker using: 
- minio.io (latest) S3 alternative
- Apache Solr 7.5
- Mysql 5.7
- Ngnix 11
- Custom PHP FPM 7.3 tunned for Drupal 8/9
- Cantaloupe 4.1.6 as IIIF Server with Video Frame extraction and PDF support
- A Skeleton Project setup to run latest Version of Drupal (8.9.2) and strawberryfield modules & friends on 8.x-1.0-beta3
- This is also our first official *Drupal 9 ready* release. We still trust 8.9.2 way more than 9.0.1 but if you dare you can give D9 a try!

The skeleton project contains all the pieces needed to run a local deployment of a vanilla Archipelago including (*YES*!) content provided as optional feature from [archipelago-recyclables](https://github.com/esmero/archipelago-recyclables)

# Starting from CERO

This is the recommended, simplest way for this release. There are a too many fun new features, bug fixes and improvements! This is also our last beta before 1.0.0

## OSX: 

[Step by Step deployment on OSX](docs/osx.md)

## Ubuntu 18.04: 

[Step by Step deployment on Ubuntu](docs/ubuntu.md)

## More fun if you add content:
[Two-Step Demo content ingest](docs/democontent.md)

## 8.x-1.0-beta3

This is our third beta release and we can not believe we are not actually on V3.9.9. We have worked *so* hard to bring fresh features, respect our own roadmap, make UI/UX more responsive and decouple code and cover almost any Media/and LoD base. Archipelago is already a little tiny gem/wonder/pumpkin/working-bee of the repository world. A full blown grown-up Repository Architecture Implementation (and still a novell one, cute and simple) that can cover, mix and match GLAM, IR, Data and Scientific/Research/Museum Tech needs, metadata in any shape and media. Ambitions are still great and even if we are quite tired -yeah, who knew one could write so much code and deploy and test so many times- we still have a long path ahead, closer than ever to a full `9.x-1.0` (a nine, not a typo). 2020 has been a strange year, little sleep, new friends, archipelagos popping up in internet and so much testing. We keep learning, making mistakes and as we look back we see how pieces of the jigsaw puzzle still fit together and make sense not only for us but most important for others. Since the beginning (a red evening under the big sky of montana) our initial architecture and divergent ideas of what Metadata managment, workflows and media preservation should be have been controversial. But, archipelago's flexibility, ease of extension, its chameleon-ish capability to assume new shapes,colors, uses cases without coding has shown us we were not incorrect. It is fun to use, fun to code on and solid to build on. If you like it or not, want new features or want to part of making this better, documenting, coding and planning, let us know. Talk (or scream) to us.

## Caring & Coding + Fixing

* [Diego Pino](https://github.com/DiegoPino)
* [Giancarlo Birello](https://github.com/giancarlobi)
* [Mitchell Keaney](https://github.com/mitchellkeaney)

## Acknowledgments

This software is a [Metropolitan New York Library Council](https://metro.org) Open-Source initiative and part of the Archipelago Commons project.

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
