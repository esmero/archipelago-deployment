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

**Last Updated:** Jun 17th 2026 for Drupal 10.6.11 during Archipelago 1.7.0 and 2.1.0 release day!

**Previously Updated:** for 2.0.0, May 22nd 2026 (2.0.0 with improvements) for https://www.drupal.org/psa-2026-05-18 

**Previously Updated:** Dec 10th 2025 (2.0.0)

This repository serves as bootstrap for a Archipelago 1.7.0 under Drupal 10 deployment on a localhost for development/testing/customizing and learning via Docker, providing a unified experience:
Also: 

 - For Drupal 10, with same features (and a way more stable Drupal), please deploy [Archipelago 1.7.0](https://github.com/esmero/archipelago-deployment/tree/1.7.0)
 - For a public facing and production ready environment please deploy [Archipelago 1.7.0 Live](https://github.com/esmero/archipelago-deployment-live/tree/1.7.0)

This release includes:

- minio.io (latest) for local S3 with Console.
- Updated Apache Solr 10.0 with custom built and updated wizardly Solr OCR Highlight library [v0.10](https://github.com/dbmdz/solr-ocrhighlighting) coded and maintained by the Development Team at the [Bavarian State Library](https://github.com/dbmdz). Thanks Johannes Baiter and team.
- MySQL 8.4(amd64/x86) or MariaDB 12.3 (Arm64/M1/M2/M3/M4/M5)
- Updated NGINX 1.31.1
- Updated Custom PHP-FPM 8.3 multi architecture, fine-tuned for Drupal 10/11 , WARC to WACZ processing, Tesseract 5 with JP2 support, PDFAlto(what a pain to build!) and latest Composer 2.x, Drush 13.x-dev, FFMPEG, FIDO, plus (NEW) Audiowave for Waveform to JSON extraction and BWFmetaedit for WAV files holding BWF metadata (Checksumming and other extras per stream).
- Natural Language Processing via NLPWEB64 multi architecture with FastText Language detection (Thanks Mike Bennett!) or alternatively Machine learning/ML containers/APIs. (Image similarity: YOLO,MobileNet,ViT(New),Insightface and Text transformer: SBERT) differentiated for arm64 and amd/intel/64
- New Cantaloupe 6.0.6 (our own versioning, but based on latest `dev` upstream) on Java 26, multi architecture, IIIF2/3 Server with precise Video Frame, PDF extraction, PDF Tiling support, new Jetty with tons of community and custom fixes.
- A Skeleton Project setup to run latest Version of Drupal 11 (11.3.12), Updated Archipelago Chiloe Base theme based on Bootstrap 5 with Light/Dark Mode (for those late night dwellers) and Strawberry Field modules on 2.1.0.
- Complete support for Apple Silicon M1/M2/M3/M4/M5 Machines and in general arm64 architecture Chips like Raspberry Pi 4, with specially built arm64 docker containers. The only differences now between deployment strategies is the DB. Blazing fast OCR.

The skeleton project contains all the pieces needed to run a local deployment of a vanilla Archipelago including (*YES*!) content provided as an optional feature from [archipelago-recyclables](https://github.com/esmero/archipelago-recyclables)

# Starting from ZERO (baby steps/spring cleanup)

This is our second dual version release. Same as last year, both versions have exact (1 to 1) feature parity but differ under the hood to accomodate for Drupal 11's Symfony 6 to 7 upgrade and deprecations, and evolving core decisions. This time also many (many) patches to contributed modules and libraries. These Archipelagos (like siblings sharing hobbies but each one with a defined personality)include updated documentation, new configurations, updated libraries and modules, deep architectural improvements, safety guards for mass ingesting professionals, preview options for insecure mass updaters, updated and improved javascript (for many Viewers, Facets and really really new Ajax interactions overrides), improved Search API and Views options, enhanced DataCite DOI integration, new technical metadata extractions for Audio and a bunch of invisible things that we really hope you never notice (and still we hope they make your life easier). Yet again, better caching and Twig improvements, overrides and safer extensions, lots of bugfixes all over the place, deprecation handling, funny comments, revisited Embargo code, more verbose logging (so much more logging), and (most importantly) eye candy spread thick (agave based sweets, but also some good old honey can be fiund). But, all that said, as with every previous release (7 years, almost 8!) as time bends and reshapes in a non linear way, and while our shared memory turns into shared dreams, there are STILL no deprecations on your data, entities, ways or needs. You are welcome!

## macOS Intel or Apple Silicon M1/M2/M3/M4/M5:

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
