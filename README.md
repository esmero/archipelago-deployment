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

**Updated:** Dec 3rd 2025 (1.6.0)

This repository serves as bootstrap for a Archipelago 1.6.0 under Drupal 10 deployment on a localhost for development/testing/customizing and learning via Docker, providing a unified experience:
Also: 
 - For Drupal 11, with same features, please deploy [Archipelago 2.0.0](https://github.com/esmero/archipelago-deployment/tree/2.0.0)
 - For a public facing and production ready environment please deploy [Archipelago 1.6.0 Live](https://github.com/esmero/archipelago-deployment-live/tree/1.6.0)

This release includes:
- minio.io (latest) for local S3 with Console.
- Updated Apache Solr 9.10.0 with updated wizardly Solr OCR Highlight library [v0.9.5](https://github.com/dbmdz/solr-ocrhighlighting/releases/tag/0.9.5) built by the Development Team at the [Bavarian State Library](https://github.com/dbmdz). Thanks Johannes Baiter and team.
- MySQL 8.0.44 (amd64/x86)/MariaDB 10.6.22(Arm64/M1/M2/M3/M4)
- NGINX 1.29.3
- Custom PHP-FPM 8.3 multi architecture, fine-tuned for Drupal 10/11 , WARC to WACZ processing, Tesseract 5 with JP2 support, PDFAlto and Composer 2.x, Drush 13.x-dev, FFMPEG, FIDO
- Natural Language Processing via NLPWEB64 multi architecture with FastText Language detection (Thanks Mike Bennett!) or alternatively Machine learning/ML containers/APIs. (Image similarity: YOLO,MobileNet,ViT(New),Insightface and Text transformer: SBERT) differentiated for `arm64` and `amd/intel/64`
- Cantaloupe 6.0.5 Snapshot on Java 23 multi architecture as IIIF2/3 Server with precise Video Frame, PDF extraction, PDF Tiling support with tons of community and custom fixes.
- A Skeleton Project setup to run latest Version of Drupal 10 (10.5.x), Updated Archipelago Chiloe Base theme based on Bootstrap 5 and Strawberry Field modules on 1.6.0 & friends on 1.0.0
- Complete support for Apple Silicon *M1/M2/M3/M4* Machines and in general `arm64` architecture Chips like Raspberry Pi 4, with specially built arm64 docker containers. The only differences now between deployment strategies is the DB. Blazing fast OCR.

The skeleton project contains all the pieces needed to run a local deployment of a vanilla Archipelago including (*YES*!) content provided as an optional feature from [archipelago-recyclables](https://github.com/esmero/archipelago-recyclables)

# Starting from ZERO (baby steps/spring cleanup)

This is a special holiday's, dual version release. To be able to cover the large difference between good old stable Drupal 10 and ongoing and evolving Drupal 11, we released a 1.6.0 and a 2.0.0 Archipelago. Both versions have exact (1 to 1) feature parity but differ under the hood to accomodate for Drupal 11's Symonfy 6 to 7 upgrade and deprecations, and some - sometimes strange - core decisions. These Archipelagos (both sisters, like minded siblings, but not twins) include updated libraries and modules, deep performance improvements, new Field formatter settings and supporting Javascript (for many Viewers, Facets and Ajax interactions) being probably the most extensive addon the the ability to use Wavesurfer and HTML blueprints to control Video and Audio (so you can style your Home Theater experience using mid century furniture, 70's courtains, while you chew on chili-flake-covered-popcorn), improved Search API filters, new Javascript everywhere and also JQuery 4.x (D11) compatibility, new Webform Elements and options for those, a new API builder tool: Custom - Digital Object/CSV driven - LoD Endpoints. New simple and humble useful tools like `JSON-API` ready Metadata Display Downloads (so you can print your creations and send via snail post to your friends), better caching and Twig improvements, overrides and new extensions, bugfixes all over the place, deprecation, faster resolving Embargoes, new DOI DataCite Integration now part of the Fragaria Module, The Strawberry Shortcake Module so you can play interactively finding similar images and grouping them together, more logs (so much more logging), improved Promon Extraction with better candidate selection, AMI Set Improvements and eye candy all over the place (sugarless or high on glucose if you prefer too). But, all that said, as with every previous release (6 years! time is a social construct), no deprecations on your data, entities, ways or needs. We hope you like it (well `them`, in this oportunity)

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

### Historic Core Contributors (Same Caring)

* [Giancarlo Birello](https://github.com/giancarlobi)

## Acknowledgments

This software is a [Metropolitan New York Library Council](https://metro.org) Open-Source initiative and part of the Archipelago Commons project.

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
