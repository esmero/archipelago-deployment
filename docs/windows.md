<!--documentation
---
title: "Installing Archipelago Drupal 10 on Windows 10/11"
tags:
  - Archipelago-deployment
  - Drupal 10
  - Windows
  - Ubuntu 18.04
  - Ubuntu 20.04
---
documentation-->

# Installing Archipelago Drupal 9 on Windows 10/11

## Prerequisites

- Windows 11 64-bit: Home or Pro version 21H2 or higher, or Enterprise or Education version 21H2 or higher (see Docker for Windows link below).
- Windows 10 64-bit: Home or Pro 21H1 (build 19043) or higher, or Enterprise or Education 20H2 (build 19042) or higher (see Docker for Windows link below).
- [Install Ubuntu on WSL 2](https://ubuntu.com/wsl)
- [Install Docker for Windows](https://docs.docker.com/desktop/windows/install/)
- [Install Github for Desktop](https://desktop.github.com/)
- At least 10 Gbytes of free space (to get started)
- Some basic Unix/Terminal Skills
- 4 Gbytes of RAM (8 Recommended)

### Optional

- [Install Github Desktop](https://desktop.github.com/). Ubuntu comes with Git by default, but for a more full-featured way to work with Github, you can install this application.

Open the Docker Desktop app. The Docker service should start up automatically with a status showing when the service is up and running.

Open an Ubuntu Terminal session (type `Ubuntu` in the Windows Start menu).

Bring everything up to date: `sudo apt update && sudo apt upgrade -y`

## Deployment

[Follow the steps for deployment in Ubuntu](ubuntu.md#step-1-deployment).

## Acknowledgment

Thanks to [Corinne Chatnik](https://github.com/chatnikc) for documenting these steps!

### Need help? Blue Screen? Missed a step? Need a hug?

If you see any issues or errors or need help with a step, please let us know (ASAP!). You can either open an `issue` in this repository or use the [Google Group](https://groups.google.com/forum/#!forum/archipelago-commons). We are here to help.

If you like this, let us know!

## Caring & Coding + Fixing + Testing

* [Diego Pino](https://github.com/DiegoPino)
* [Allison Lund](https://github.com/alliomeria)
* [Giancarlo Birello](https://github.com/giancarlobi)

## License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)
