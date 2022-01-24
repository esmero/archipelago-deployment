<!--documentation
---
title: "Archipelago-deployment for Drupal 9"
tags:
  - Archipelago-deployment
  - Drupal 9
  - Docker
---
documentation-->

# Archipelago Docker Deployment for Drupal 9

**Updated:** November 25th 2021

This repository serves as bootstrap for a Archipelago 1.0.0-RC3 deployment via Docker and provides many more options this time:

- minio.io (latest) S3/Azure/Local/Remote alternative with a new Console and also Gateway to many others.
- Apache Solr 8.8.2 (or 7.5 if you go legacy) with the wizardly Solr OCR Highlight library [v0.7.1](https://github.com/dbmdz/solr-ocrhighlighting/releases/tag/0.7.1) build by the Developement Team at the [Bavarian State Library](https://github.com/dbmdz). Thanks Johannes Baiter!
- MySQL 8.0.22 (or MySQL 5.7 if you go legacy)
- NGINX 11
- Custom PHP FPM 7.4 super-tuned for Drupal 8/9 with multi-arch (so M1 too) capabilities (or 7.3 FPM if you go legacy), WARC to WACZ processing, and Composer 2.0
- Natural Language Processing via NLPWEB64
- Cantaloupe 4.1.9 as IIIF Server with Video Frame extraction and PDF support
- A Skeleton Project setup to run latest Version of Drupal (9.2.9) and Strawberry Field modules on 1.0.0-RC3 & friends on 0.2.0
- Official *Drupal 9 ready* release again. D9.2.9 this time. Drupal 8 is no longer maintained, and we have [documented the upgrade path](docs/upgradeFromD8ToD9.md)
- Complete support for Apple Silicon *M1* Machines and in general arm64 architecture Chips like Raspberry Pi 4, with specially built arm64 docker containers. Blazing fast OCR!

The skeleton project contains all the pieces needed to run a local deployment of a vanilla Archipelago including (*YES*!) content provided as an optional feature from [archipelago-recyclables](https://github.com/esmero/archipelago-recyclables)

# Starting from ZERO

This is the recommended, simplest way for this release. There are a too many, tons of fun new features, Metadata Displays, viewers, new JS libraries, better HUGE import capabilities, bug fixes (yes), webform elements and improvements! W3C WebAnnotations capabilities are even better now by the great team behind <https://recogito.github.io/annotorious/api-docs/osd-plugin/> (thanks Rainer Simon) and with complete integration in our UI and metadata backends. Also [WACZ! and replay.web](https://github.com/webrecorder/replayweb.page) both fabulous developments by the Webrecorder team (thanks Ilya Kreymer and Emma Dickson). There is more. Release will have a full feature list. Promise.

## macOS Intel or Apple Silicon M1:

[Step by Step deployment on macOS](docs/osx.md)

## Ubuntu 18.04 or 20.04:

[Step by Step deployment on Ubuntu](docs/ubuntu.md)

## More fun if you add content:

[One-Step Demo content ingest](docs/democontent.md)

## 1.0.0-RC3

We have been working hard on 1.0.0-RC3, and it again took us 6 months from the latest release to reach this point. RC3 is different. There won't be any more Release Candidates and this leads directly (in a time span of 2–3 weeks) into 1.0.0—and from there on to 1.1.0, etc. You already know we take Release Candidates seriously, and this one brings a huge list of new features, improvements, and migration tools, finally closing the cycle. There are many bug fixes, requested needs, improvements, AMI with remote import and LoD reconciliation, invisible and visible workflow changes, smarter processing, and most importantly, all is made to allow you to extend Archipelago even more. We ship now with a lot more Site Building (fancy word for settings, views, field formatters, Solr, etc. in Drupal) to make starting with Archipelago or becoming a permanent resident of your own group of always sunny islands fun.

You get (yet again) fresh, strange, bizarre, unusual and/or amazing features that were not even asked for! We still work hard to not deviate from our own roadmap—keeping the North Star always visible while navigating these stormy waters—to make UI/UX clearer to understand, to make code less redundant and easier to follow, and to cover (so close) every Media/and LoD base we could wish for. This Archipelago feels like a sunny beach day with friends and Samba. Every day we use it, and it manages, from time to time, to produce wonderful surprises. It is our tiny, little secret garden/pumpkin/working-bee/undiscovered-magical-islands, and we are happy we see it as our own home or at least a place to which you will keep coming back. A child with grown-up Repository responsabilities, a planned and consistent Architecture Implementation (and still a novel one, cute, cozy, and simple) that can cover, mix and match GLAM, IR, Data and Scientific/Research/Museum Tech/Education needs, metadata, and media in any shape.

Our ambitions never cease to be enormous (we try to be humble), and we are always quite a bit tired (same as with Beta1, Beta2, Beta3 and RC1). Who knew we could write so much code and deploy and test over and over? We know the Horizon is still far away, and we may never end sailing towards it.

No need to tell you that 2020 and 2021 have been strange years so far, and there is and there will continue to be constant reflecting on past times. Many, many more Archipelagos have been emerging from the depths of the sea (and the shallow Internet), and a few are already blooming rich in local flora and fauna. We want to keep learning and sharing, and we want you to keep asking. We may make mistakes while doing so, but our conviction that all still fits together and makes sense, not only for us but most important for others, is very strong.

Since the beginning (a red evening under the big sky of Montana) our initial architecture and divergent ideas about what metadata management, workflows, and media preservation should be, have been controversial and sometimes hard to explian, but Archipelago's simplicity, flexibility, ease of extension, its chameleon-ish capability to assume new shapes, colors, and aromas, and use cases without coding have shown us that we put our efforts into the right dream and the right people. Fun to use, fun to code on, and solid to build on.

If you like it (or not), want new features, or want to be part of making this better (documenting, coding and planning) let us know. Talk (or whisper) to us.

## Caring & Coding + Fixing + Testing

* [Diego Pino](https://github.com/DiegoPino)
* [Allison Lund](https://github.com/alliomeria)
* [Giancarlo Birello](https://github.com/giancarlobi)
* [Albert Min](https://github.com/aksm)

## Acknowledgments

This software is a [Metropolitan New York Library Council](https://metro.org) Open-Source initiative and part of the Archipelago Commons project.

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
