<!--documentation
---
title: "Archipelago-deployment for Drupal 10"
tags:
  - Archipelago-deployment
  - Drupal 10
  - Docker
---
documentation-->

# Archipelago Docker Deployment

**Updated:** June 19th 2025 (1.5.0)

This repository serves as bootstrap for a Archipelago 1.5.0 deployment on a localhost for development/testing/customizing via Docker and provides a more unified experience this time:

- minio.io (latest) for local S3 with Console.
- Updated Apache Solr 9.8.1 with the (updated) wizardly Solr OCR Highlight library [v0.9.4](https://github.com/dbmdz/solr-ocrhighlighting/releases/tag/wip) built by the Development Team at the [Bavarian State Library](https://github.com/dbmdz). Thanks Johannes Baiter and team.
- MySQL 8.0.42 (amd64/x86)/MariaDB 10.6.22(Arm64/M1/M2/M3/M4)
- NGINX 1.27.5
- Custom PHP-FPM 8.3 multi architecture, fine-tuned for Drupal 10 , WARC to WACZ processing, Tesseract 5 with JP2 support, PDFAlto and Composer 2.x, Drush 13.x-dev, FFMPEG, FIDO
- Updated Natural Language Processing via NLPWEB64 multi architecture with FastText Language detection (Thanks Mike Bennett!) or alternatively new ML containers/APIs. (Image similarity: YOLO,MobileNet,ViT(New),Insightface and Text transformer: SBERT) differentiated for `arm64` and `amd/intel/64`
- Cantaloupe 6.0.5 Snapshot on Java 23 multi architecture as IIIF2/3 Server with precise Video Frame, PDF extraction, PDF Tiling support with tons of community and custom fixes.
- A Skeleton Project setup to run latest Version of Drupal (10.4.x), Bootstrap 5 theme and Strawberry Field modules on 1.5.0 & friends on 0.9.0
- Complete support for Apple Silicon *M1/M2/M3/M4* Machines and in general `arm64` architecture Chips like Raspberry Pi 4, with specially built arm64 docker containers. The only differences now between deployment strategies is the DB. Blazing fast OCR.

The skeleton project contains all the pieces needed to run a local deployment of a vanilla Archipelago including (*YES*!) content provided as an optional feature from [archipelago-recyclables](https://github.com/esmero/archipelago-recyclables)

# Starting from ZERO (baby steps/spring cleanup)

This is the way. Also the recommended, cleanest way, to evaluate this release. The amount (quantity/quality/flavor) of amazing new features, bug fixes and performance improvements is simply atonishing. To mention a few: smarter Date Range faceting (fast/super fast even if your collection spans from 300 BC to our shared, very own, strange year of 2025), new AMI mass ingest features including Actions on AMI Sets, new CSV expander queues, EAD Sync, per CSV Row actions, Super fast (danger!) deletes, background Hydroponics driven Search API indexing (edited thousand Objects? probably already indexed and ready to go!), better IIIF Content Search API including now also Metadata discovery (Sorry specs, people asked for it), new Twig Extensions and even Twig Rendering (deep down/nerd mode) overrides to please the render array evil gods, new AJAX overrides and improvements, better OCR,TEXT Joins on searches. ML/AI evaluation continues for authenticated user: Chained Detection/Identification workflows with dynamic Annotations (clickable/searchable, new and improved models (every wondered if a model has a "color" fixation? try your vectors in gray scale). Totally new embargo options, with, per ADO/global overrides including File download endpoint enforcements and exposed metadata endpoints. Have a multi gigabyte file you need to upload in realtime? No need to modify your PHP settings anymore, chunked (resumable) file transfer via TUS was integrated into your webforms. ORCID autocomplete and new IR scholar/student/faculty custom elements. Tons of new Formatter/Viewers features. And so much more. So much.

But (that is not all! that is not all), also: backend improvements/upgrades is great. Moving from Solr 9.1 to 9.8.1 (wow), new PHP 8.3 (we made sure we got one that has no security issues!), new Cantaloupe Server with more JAVA customizations and of course the all new/refreshed NLP/ML containers.

## macOS Intel or Apple Silicon M1/M2/M3/M4:

[Step by Step deployment on macOS](docs/osx.md)

## Ubuntu 20.04+:

[Step by Step deployment on Ubuntu](docs/ubuntu.md)

## Windows 10 or 11:

[Step by Step deployment on Windows](docs/windows.md)

## More fun if you add content:

[One-Step Demo content ingest](docs/democontent.md)

If you like it (or not.. but we know you like it), want new features, need a bug fix, are in doubt, or want to be part of making this better (documenting, coding and planning) let us know. Make your voice and opinion be heard, this is a community effort.

## Caring & Coding + Fixing + Testing

* [Diego Pino](https://github.com/DiegoPino)
* [Allison Sherrick](https://github.com/alliomeria)
* [Giancarlo Birello](https://github.com/giancarlobi)

## Acknowledgments

This software is a [Metropolitan New York Library Council](https://metro.org) Open-Source initiative and part of the Archipelago Commons project.

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
