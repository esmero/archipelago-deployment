# Archipelago Docker Deployment for Drupal 9

**Updated:** May 16th 2021

This repository serves as bootstrap for a Archipelago 1.0.0-RC2 deployment via Docker using and provides this time many more options:

- minio.io (RELEASE.2021-06-07T21-40-51Z) S3/Azure/Local/Remote alternative and also Gateway to many others.
- Apache Solr 8.8.2 (or 7.5 if you go legacy) with the wizardly Solr OCR Highlight library [v0.5](https://github.com/dbmdz/solr-ocrhighlighting/releases/tag/0.5.0) build by the Developement Team at the [Bavarian State Library](https://github.com/dbmdz). Thanks Johannes Baiter!
- Mysql 8.0.22 (or Mysql 5.7 if you go legacy)
- Ngnix 11
- Custom PHP FPM 7.4 zuper-tunned for Drupal 8/9 (or 7.3 FPM if you go legacy) with WARC to WACZ processing and Composer 2.0
- Natural Language Processing via NPLWEB64
- Cantaloupe 4.1.9 as IIIF Server with Video Frame extraction and PDF support
- A Skeleton Project setup to run latest Version of Drupal (9.1.8) and strawberryfield modules & friends on 1.0.0-RC2
- Official *Drupal 9 ready* release again. D9.1 this time. Drupal 8 has its own branch to avoid cluttering this one too much. Look for 1.0.0-RC2

The skeleton project contains all the pieces needed to run a local deployment of a vanilla Archipelago including (*YES*!) content provided as optional feature from [archipelago-recyclables](https://github.com/esmero/archipelago-recyclables)

# Starting from CERO

This is the recommended, simplest way for this release. There are a too many, tons of fun new features, Metadata Displays, viewers, bug fixes (yes), webform elements and improvements! We include now W3C WebAnnotations capabilities provided by the great team behind https://recogito.github.io/annotorious/api-docs/osd-plugin/ (thanks Rainer Simon) and with complete integration in our UI and metadata backends. Also [WACZ! and replay.web](https://github.com/webrecorder/replayweb.page) both fabulous developments by the Webrecorder team (thanks Ilya Kreymer and Emma Dickson). There is more. Release will have a full feature list. Promised.

## OSX:

[Step by Step deployment on OSX](docs/osx.md)

## Ubuntu 18.04 or 20.04:

[Step by Step deployment on Ubuntu](docs/ubuntu.md)

## More fun if you add content:
[One-Step Demo content ingest](docs/democontent.md)

## 1.0.0-RC2

We have been working hard on 1.0.0-RC2 and we may have delayed this a little more than expected. As you may have read (or heard) we take Release Candidates seriously and wanted to advance core features before closing the cycle. There are many bug fixes, improvements, AMI, invisible and visible workflow changes, smarter processing, and most important all made to allow you to extend Archipelago even more. We ship now with a lot more Site Building (fancy word for settings views, field formatters, Solr, etc in Drupal)to make starting with Archipelago or becoming a permanent resident of your own group of always sunny islands fun.

You get (yet) again fresh, strange, bizarre, unusual and/or amazing features that were not even asked for! We still work hard to not deviate from our own roadmap, keeping the North Star always visible while navigating these stormy waters, to make UI/UX clearer to understand, code less redundant and easier to follow, to cover (so close) every Media/and LoD base we could wish for. This Archipelago feels like a beach day everyday we use it and manages from time to time produce wonderful surprises. It is our little tiny secret garden/pumpkin/working-bee/undiscovered-magical-islands and we are happy we see it as our own home. A child with grown-up Repository responsabilities, a planned and consistent Architecture Implementation (and still a novell one, cute, cozy and simple) that can cover, mix and match GLAM, IR, Data and Scientific/Research/Museum Tech/Education needs, metadata and media in any shape.

Ambitions never end to be enorm (we try to be humble) and we are always a bit quite tired (same as with Beta1, Beta2, Beta3 and RC1). Who knew we could write so much code and deploy and test over and over? We know the Horizon is still far away and we may never end sailing towards it.

No need to tell you that 2020 and 2021 so far have been strange years and there is and will be constant reflecting on past times. Many many more Archipelagos have been emerging from the depths of the sea (and the shallow Internet) and a few already are blooming rich in local flora and fauna. We want to keep learning and sharing and you to keep asking, we may make mistakes while doing so, but our conviction that all still fits together and makes sense not only for us but most important for others is very strong.

Since the beginning (a red evening under the big sky of Montana) our initial architecture and divergent ideas of what Metadata managment, workflows and media preservation should be, have been controversial and sometimes hard to explian. But, archipelago's simplicity, flexibility, ease of extension, its chameleon-ish capability to assume new shapes, colors and aromas, use cases without coding has shown us we put our efforts in the right dream and the right people. Fun to use, fun to code on and solid to build on.

If you like it or not, want new features or want to part of making this better, documenting, coding and planning, let us know. Talk (or whisper) to us.

## Caring & Coding + Fixing + Testing

* [Diego Pino](https://github.com/DiegoPino)
* [Giancarlo Birello](https://github.com/giancarlobi)
* [Allison Lund](https://github.com/alliomeria)

## Acknowledgments

This software is a [Metropolitan New York Library Council](https://metro.org) Open-Source initiative and part of the Archipelago Commons project.

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
