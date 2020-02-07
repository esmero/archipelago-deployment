# Archipelago Docker Deployment

**Updated:** February 7th 2020

This repository serves as bootstrap for a Archipelago 8.x-1.0-beta2 deployment via Docker using: 
- minio.io (latest) S3 alternative
- Apache Solr 7.5
- Mysql 5.7
- Ngnix 11
- Custom PHP FPM 7.3 tunned for Drupal 8
- Cantaloupe as IIIF Server with Video Frame extraction and PDF support
- A Skeleton Project setup to run latest Version of Drupal (8.8.1) and strawberryfield modules & friends on 8.x-1.0-beta2

The skeleton project contains all the pieces needed to run a local deployment of a vanilla Archipelago except (for now) content, which we know you will happily provide while testing!

# Starting from CERO

This is the recommended, simplest way for this release. There are a lot of exciting new features and improvements! 

## OSX: 

[Step by Step deployment on OSX](docs/osx.md)

## Ubuntu 18.04: 

[Step by Step deployment on Ubuntu](docs/ubuntu.md)

## 8.x-1.0-beta2

This is our second beta release and it almost feels like V2.0.0. Lot's have been done, make faster, make smarter and Archipelago is now a full blown Repository Architecture Implementation (and a novell one) that can cover, mix and match GLAM, IR, Data and Scientific/Research needs, metadata in any shape and media. We have great ambitions and still have a long path ahead, at least 2 more Betas until we we are ready for a full `8.x-1.0`. It has been a good time, little sleep, lots of learning and every time we look back we see how all parts fit together and make sense. As before, our initial architecture and divergent ideas of what Metadata managment should be show us how flexible Archipelago is to be extended, to assume new shapes and uses cases without coding, fun to use and code and solid to build on. If you like this or not, want new features or want to part of making this better, documenting, coding and planning, let us know.

## Caring & Coding + Fixing

* [Diego Pino](https://github.com/DiegoPino)
* [Giancarlo Birello](https://github.com/giancarlobi)
* [Mitchell Keaney](https://github.com/mitchellkeaney)
* [Marlo Longley](https://github.com/marlo-longley)

## Acknowledgments

This software is a [Metropolitan New York Library Council](https://metro.org) Open-Source initiative and part of the Archipelago Commons project.

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
