<!--documentation
---
title: "Archipelago-deployment for Drupal 9"
tags:
  - Archipelago-deployment
  - Drupal 9
  - Docker
---
documentation-->

# Archipelago Docker Deployment

**Updated:** June 5th 2023

This repository serves as bootstrap for a Archipelago 1.1.0 deployment on a localhost for development/testing/customizing via Docker and provides a more unified experience this time:

- minio.io (latest with Gateway Support) S3/Azure/Local/Remote alternative with Console.
- Apache Solr 9.1 with the wizardly Solr OCR Highlight library [v0.8.4](https://github.com/dbmdz/solr-ocrhighlighting/releases/tag/wip) built by the Developement Team at the [Bavarian State Library](https://github.com/dbmdz). Thanks Johannes Baiter and team.
- MySQL 8.x (amd64/x86)/MariaDB 10.6.x(Arm64/M1)
- NGINX 11
- Custom PHP-FPM 8.0 multi architecture ,fine-tuned for Drupal 9/10 , WARC to WACZ processing, Tesseract 5 with JP2 support, PDFAlto and Composer 2.x, etc
- Natural Language Processing via NLPWEB64 multi architecture with FastText Language detection (Thanks Mike Bennet!)
- Cantaloupe 6.0.0 Snapshot multi architecture as IIIF2/3 Server with Video Frame extraction and PDF support
- A Skeleton Project setup to run latest Version of Drupal (9.5.x), our new Bootstrap 5 theme and Strawberry Field modules on 1.1.0 & friends on 0.5.0
- Complete support for Apple Silicon *M1* Machines and in general `arm64` architecture Chips like Raspberry Pi 4, with specially built arm64 docker containers. The only differences now between deployment strategies is the DB. Blazing fast OCR.

The skeleton project contains all the pieces needed to run a local deployment of a vanilla Archipelago including (*YES*!) content provided as an optional feature from [archipelago-recyclables](https://github.com/esmero/archipelago-recyclables)

# Starting from ZERO

This is the recommended, simplest way for this release. There are a too many, tons of fun new features, Metadata Displays, Webforms, New formatters and Twig extensions, improved viewers, new and improved JS libraries, OpenCV/Face Detection, smarter NLP, File composting, better HUGE import/update capabilities, bug fixes (yes so many) so please try them out. The team has also updated the DEMO AMI set (Content) to showcase metadata/display improvements.

## macOS Intel or Apple Silicon M1:

[Step by Step deployment on macOS](docs/osx.md)

## Ubuntu 18.04 or 20.04:

[Step by Step deployment on Ubuntu](docs/ubuntu.md)

## Windows 10 or 11:

[Step by Step deployment on Windows](docs/windows.md)

## More fun if you add content:

[One-Step Demo content ingest](docs/democontent.md)

If you like it (or not), want new features, or want to be part of making this better (documenting, coding and planning) let us know. Make your voice and opinion be heard, this is a community effort.

## Caring & Coding + Fixing + Testing

* [Diego Pino](https://github.com/DiegoPino)
* [Allison Sherrick](https://github.com/alliomeria)
* [Giancarlo Birello](https://github.com/giancarlobi)
* [Katie Romabiles](https://github.com/karomabiles)
* [Albert Min](https://github.com/aksm)

## Acknowledgments

This software is a [Metropolitan New York Library Council](https://metro.org) Open-Source initiative and part of the Archipelago Commons project.

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
