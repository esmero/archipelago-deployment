# Archipelago Docker Deployment

**Updated:** December 14th 2020 (12th year of the dark century known as 2020)

This repository serves as bootstrap for a Archipelago 1.0.0-RC1 deployment via Docker using and provides this time many more options:

- minio.io (latest) S3/Azure/Local/Remote alternative
- Apache Solr 8.7 (or 7.5 if you go legacy) with the wizardly Solr OCR Highlight library [v0.5](https://github.com/dbmdz/solr-ocrhighlighting/releases/tag/0.5.0) build by the Developement Team at the [Bavarian State Library](https://github.com/dbmdz). Thanks Johannes Baiter!
- Mysql 8.0.22 (or Mysql 5.7 if you go legacy)
- Ngnix 11
- Custom PHP FPM 7.4 zuper-tunned for Drupal 8/9 (or 7.3 FPM if you go legacy) with WARC to WACZ processing and Composer 2.0!
- Natural Language Processing via NPLWEB64
- Cantaloupe 4.1.7 as IIIF Server with Video Frame extraction and PDF support
- A Skeleton Project setup to run latest Version of Drupal (8.9.11) and strawberryfield modules & friends on 1.0.0-RC1
- Official *Drupal 9 ready* release again. D9.1 this time. It has its own branch to avoid cluttering this one too much. Look for 1.0.0-RC1D9

The skeleton project contains all the pieces needed to run a local deployment of a vanilla Archipelago including (*YES*!) content provided as optional feature from [archipelago-recyclables](https://github.com/esmero/archipelago-recyclables)

# Starting from CERO

This is the recommended, simplest way for this release. There are a too many, tons of fun new features, Metadata Displays, viewers, bug fixes (yes), webform elements and improvements! We include now W3C WebAnnotations capabilities provided by the great team behind https://recogito.github.io/annotorious/api-docs/osd-plugin/ (thanks Rainer Simon) and with complete integration in our UI and metadata backends. Also [WACZ! and replay.web](https://github.com/webrecorder/replayweb.page) both fabulous developments by the Webrecorder team (thanks Ilya Kreymer and Emma Dickson). There is more. Release will have a full feature list. Promised.

## OSX:

[Step by Step deployment on OSX](docs/osx.md)

## Ubuntu 18.04 or 20.04:

[Step by Step deployment on Ubuntu](docs/ubuntu.md)

## More fun if you add content:
[Two-Step Demo content ingest](docs/democontent.md)

## 1.0.0-RC1

We have been working on 1.0.0-RC1 for months. Feels for ever. We could have sailed long ago, but we had the need to finish requested features and make everything more robuts. Fix bugs. Make new workflows possible. You get again fresh, strange and/or amazing features and also hairloom ones (kept by generations of catalogers) that you would expect from any repository but funny enough you don't get sometimes. We worked hard to not deviate from our own roadmap, from the soul of this system, to make UI/UX more appealing and strip unneded code, adding silly comments in eery commit and making everything more flexible to cover (almost) every Media/and LoD base we could. Archipelago feels like fresh ocean breeze everyday we use it and gives us from time to time wonderful surprises. It is our little tiny gem/wonder/pumpkin/working-bee/undiscovered-magical-islands and we are happy we have decided as our home. A child with grown-up Repository responsabilities, a planned and consistent Architecture Implementation (and still a novell one, cute, cozy and simple) that can cover, mix and match GLAM, IR, Data and Scientific/Research/Museum Tech needs, metadata in any shape and media. Ambitions never end to be grandious (but we try to be humble, really) and even if we are quite tired -uff (same as with Beta3), who knew we could write so much code and deploy and test so many times!- we still have a long path ahead and we may never end walking. No need to tell you that 2020 has been a strange year but also one in the confusion and sadness brought new friends and new ways. Many many archipelagos popping up in internet and so much feedback. We want to keep learning, making mistakes and as we look back we contemplate how all fits together still and make sense not only for us but most important for others. Since the beginning (a red evening under the big sky of montana) our initial architecture and divergent ideas of what Metadata managment, workflows and media preservation should be, have been controversial. But, archipelago's simplicity, flexibility, ease of extension, its chameleon-ish capability to assume new shapes, colors, uses cases without coding has shown us we put our efforts in the right dream. Fun to use, fun to code on and solid to build on.

If you like it or not, want new features or want to part of making this better, documenting, coding and planning, let us know. Talk (or whisper) to us.

## Caring & Coding + Fixing + Testing

* [Diego Pino](https://github.com/DiegoPino)
* [Giancarlo Birello](https://github.com/giancarlobi)
* [Allison Lund](https://github.com/alliomeria)

## Acknowledgments

This software is a [Metropolitan New York Library Council](https://metro.org) Open-Source initiative and part of the Archipelago Commons project.

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
