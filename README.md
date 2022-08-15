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

**Updated:** August 15th 2022

This repository serves as bootstrap for a Archipelago 1.0.0 deployment on a localhost for development/testing/customizing via Docker and provides a more unified experience this time:

- minio.io (latest with Gateway Support) S3/Azure/Local/Remote alternative with Console.
- Apache Solr 8.11.2 (or 7.5 if you go legacy) with the wizardly Solr OCR Highlight library [v0.7.1](https://github.com/dbmdz/solr-ocrhighlighting/releases/tag/0.7.1) build by the Developement Team at the [Bavarian State Library](https://github.com/dbmdz). Thanks Johannes Baiter and team.
- MySQL 8.0.28 (amd64/x86)/MariaDB 10.6.8(Arm64/M1)
- NGINX 11
- Custom PHP-FPM 8.0 multi architecture ,fine-tuned for Drupal 9/10 , WARC to WACZ processing, Tesseract 5 with JP2 support, PDFAlto and Composer 2.x, etc
- Natural Language Processing via NLPWEB64 multi architecture with FastText Language detection (Thanks Mike Bennet!)
- Cantaloupe 6.0.0 Snapshot multi architecture as IIIF2/3 Server with Video Frame extraction and PDF support
- A Skeleton Project setup to run latest Version of Drupal (9.4.x), our new Bootstrap 5 theme and Strawberry Field modules on 1.0.0 & friends on 0.4.0
- Drupal 8 is no longer maintained, and we have [documented the upgrade path](docs/upgradeFromD8ToD9.md)
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

## 1.0.0

### Ode to the in-betweens, the invisible paths through the meadow

Archipelago, the humble tiny dream, the initial impossible thought turned into a colorful idea, the careful act of choosing, curating, planting seeds, nurturing and watering, waiting and contemplating the seasons come and go, the software that became a tiny garden, a communal space where many of you came and went and returned to stay a little bit longer, the idea turned into a community that adopted (the software) the space, hopes and care, is flowering once again in the form of a release and you are welcome to sit, read, reflect, enjoy, watch the birds (or be them), inhale deep and let the wind build a wild mix of colors and perfumes on a long hot summer evening.

The semantics of the versioning of this release -1.0.0 - are confusing. Building software the way we think of software is tricky. We decided to release not often because we believe users and ourselves don’t deserve the pain of upgrades so every release packs a lot. Also we had an initial goal--some daisies, dandelions, beans and pumpkin plants needed to be present, not fair having a 2.0 for a patch of dirt with a promise. Note: If this is already too much jump to the release notes at the end (but really, keep reading).

At this point, it may feel that all previous versions and past 3 1/2 years of public code (e.g RC2 or Beta3 or even alphas, or some better known by their nicknames “a Cat's Pajamas” or “All grand beauties withhold their deepest secrets") were - semantically - continues loops - a rehearsal- around a circular laid path (your needs, our shared sometimes goals) in the aim of learning, revisiting each step, avoiding larger stones and having a clear start and end you can walk safely over and over (a circle of refinement). But to be honest (as someone that has been walking the main road laid in front here, filling up a hole here and there, but mostly visiting the side tracks and invisible paths between the bushes while doing so) it was never about the path; I say this in the deeper sense of two dots that connect. It was always (or became) about the slowly, patiently contemplated displacement. It is now and then about the surroundings, the changing seasons, the evolving and devolving of the landscape and mostly about the people (you, them) that we met, the shared times, the learning, narratives and tales and space while laying new reasons to advance and finding old reasons to stay behind. The past and present tense(s) are all entangled.

Said differently, 1.0.0 might as well be version 5.7.2. Even if it is more than acceptable and desirable to have a concrete clear goal here (CS people will agree/enforce this and everyone trusts full versions and defined roadmaps, feature lists, in software way more anyway) of what this Software and Community can/wants to be and where in the grand (or small) scheme of things a Repository system even falls into, what we all have built as a community is not a technologically imposed thing where to put/extract/safely meta(meta(data)) and media -only- but a safe space to build on concretely. A platform upon which to set down, brick by brick, your needs and ideas that  support your uses, that represent your core daily work efforts, a space to keep and share histories (your objects), ways, workflows, relationships that are the real gold (the yellow flowers in this meadow), your efforts and evolving needs and wishes. This is made possible not by providing the what purely, but the hows and whys, the ability to put new and old ways in place without breaking the fragile balance of what was already done, the road (sunset, sunrise?) left behind, that is still so treasured and valid.

So. 1.0.0, "shimmering at the meadow's edge"<sup>1</sup>, is somewhere in between a future path and the offset edge of a well walked one. And it is a happy place. We are privileged and proud (and lucky) that we have not left anyone behind and that we could stay true to our initial ideas. We have made more tools/tooling and the existing ones more colorful (fast too) and reliable. We have created things that you would not find somewhere else, not just because we can, but because we think you might need those. We have put reflections, self-critic, external criticism, deep care for details, time, efforts, inline comments, hundreds of slack messages and strong cups of coffee and tea into this software; and open minds and hearts into the act of community nurturing. We ensured that all what you have/had/knew is still valid - and in a huge effort for being (finally!) super concrete here - without introducing any deprecation or changes that could affect your precious (meta)data, the fruit of your efforts. All this means anything ingested on day one (Sep 18, 2018, when nobody even knew we were even planning this) is as valid, as immutable and as plastic, portable and yours as ever and will keep being so. Also worth mentioning, Archipelagos are running in the wild (never to be domesticated) in nearly every continent, from humble to large, with simple petals and some with complex/compound blooms, using pre conceived use cases and data models or unexpected ones. Finally, we hope you like it (or love it, what is even the difference?) and that your work will be easier because of it. 

If you like it (or not), want new features, or want to be part of making this better (documenting, coding and planning) let us know. Make your voice and opinion be heard, this is a community effort.

  1. Kimmerer, Robin Wall. Braiding Sweetgrass. Milkweed Editions, 2015.

## Caring & Coding + Fixing + Testing

* [Diego Pino](https://github.com/DiegoPino)
* [Giancarlo Birello](https://github.com/giancarlobi)
* [Allison Lund](https://github.com/alliomeria)
* [Katie Romabiles](https://github.com/karomabiles)
* [Albert Min](https://github.com/aksm)

## Acknowledgments

This software is a [Metropolitan New York Library Council](https://metro.org) Open-Source initiative and part of the Archipelago Commons project.

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
