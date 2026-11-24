<!--documentation
---
title: "Archipelago-deployment for Drupal 11"
tags:
  - Archipelago-deployment
  - Drupal 11
  - Docker
---
documentation-->

# Archipelago Docker Deployment

**Last Updated:** Nov 23th 2026 for Drupal 11.4.13 and Archipelago 2.2.0 release day!

**Previously Updated:** Sept 15th 2026, replaces removed stock `minio/minio:latest` with `cgr.dev/chainguard/minio:latest`

**Previously Updated:** Jun 17th 2026 for Drupal 11.3.12 during Archipelago 1.7.0 and 2.1.0 release day!

**Previously Updated:** for 2.0.0, May 22nd 2026 (2.0.0 with improvements) for https://www.drupal.org/psa-2026-05-18 

**Previously Updated:** Dec 10th 2025 (2.0.0)

This repository serves as bootstrap for a Archipelago 2.2.0 under Drupal 11.4 and PHP 8.4+ (new to this release) deployment on a localhost for development/testing/customizing and learning via Docker, providing a unified experience:
Also: 

 - For a public facing and production ready environment please deploy [Archipelago 2.2.0 Live](https://github.com/esmero/archipelago-deployment-live/tree/2.2.0)

This release includes:

- minio.io (latest from cgr.dev/chainguard ) for local S3 with Console.
- Updated Apache Solr 10.0 with custom built and updated wizardly Solr OCR Highlight library [v0.11](https://github.com/dbmdz/solr-ocrhighlighting) coded and maintained by the Development Team at the [Bavarian State Library](https://github.com/dbmdz). Thanks Johannes Baiter and team.
- MySQL 8.4(amd64/x86) or MariaDB 12.3 (Arm64/M1/M2/M3/M4/M5)
- Updated NGINX 1.31.9
- Updated & Custom PHP-FPM 8.4+ (new to this release) multi architecture, fine-tuned for Drupal 11, WARC to WACZ processing, Tesseract 5 with JP2 support, PDFAlto(what a pain to build!) and latest Composer 2.x, Drush 13.x-dev, FFMPEG, FIDO, plus Audiowave for Waveform to JSON extraction and BWFmetaedit for WAV files holding BWF metadata (Checksumming and other extras per stream).
- Natural Language Processing via NLPWEB64 multi architecture with FastText Language detection (Thanks Mike Bennett!) or alternatively Machine learning/ML containers/APIs. (Image similarity: YOLO,MobileNet,ViT(New),Insightface and Text transformer: SBERT) differentiated for arm64 and amd/intel/64
- Newest Cantaloupe (our own versioning, but based on latest `dev` upstream) on Java 27, multi architecture, IIIF2/3 Server with precise Video Frame, PDF extraction, PDF Tiling support, new Jetty with tons of community and custom fixes.
- A Skeleton Project setup to run latest Version of Drupal 11 (11.4.13), Updated Archipelago Chiloe Base theme based on Bootstrap 5 with Light/Dark Mode (for those late night dwellers) and Strawberry Field modules on 2.2.0.
- Complete support for Apple Silicon M1/M2/M3/M4/M5 Machines and in general arm64 architecture Chips like Raspberry Pi 4, with specially built arm64 docker containers. The only differences now between deployment strategies is the DB. Blazing fast OCR.

The skeleton project contains all the pieces needed to run a local deployment of a vanilla Archipelago including (*YES*!) content provided as an optional feature from [archipelago-recyclables](https://github.com/esmero/archipelago-recyclables)

# Starting from ZERO (baby steps/spring cleanup)

This is our first Drupal 11 only release but most importantly a complete refactor for PHP 8.4+ which includes patches to contributed modules and libraries. We include updated documentation, new configurations, updated libraries, better accesibility work on our theme, updated (and other removed modules, security fixes and improvements, renewed javascript, 2 new IIIF Viewers (Triiiceratops and Clover 4) deeper architectural improvements, safety guards for mass ingesting professionals, preview options for insecure mass updaters, better Facet and Date logic and of course really new Ajax interactions overrides, improved Search API and Views options and too many but needed invisible changes that you might never notice (and still we hope they make your life easier). Yet again, better caching and Twig improvements, overrides and safer extensions, lots of bugfixes all over the place, deprecation handling, funny comments (and some less funny), as with every previous release (8 years, almost 9!) we maintain the promise of no deprecations on your data, entities, ways or needs.

## macOS Intel or Apple Silicon M1/M2/M3/M4/M5:

[Step by Step deployment on macOS](docs/osx.md)

## Ubuntu 24.04+:

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
