# rocker-win

[![Project Status: Concept – Minimal or no implementation has been done yet, or the repository is only intended to be a limited example, demo, or proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3584107.svg)](https://doi.org/10.5281/zenodo.3584107)

Proof of concept for running [R](https://www.r-project.org/) in [Windows Containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index) with [Docker for Windows](https://docs.docker.com/docker-for-windows/).
It provides selected images based on [`microsoft/windowsservercore`](https://hub.docker.com/r/microsoft/windowsservercore/), using various base images and exploring automated builds on different platforms.

## Available images

This little side-project is currently for exploration only, therefore not all bugfix versions of R are re-build regularly.
The base images are limited by the availability of Microsoft Windows Server versions of public CI platforms, since I have only limited access to Windows myself.

[![](https://images.microbadger.com/badges/image/nuest/rocker-win.svg)](https://microbadger.com/images/nuest/rocker-win "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/nuest/rocker-win.svg)](https://microbadger.com/images/nuest/rocker-win "Get your own version badge on microbadger.com")

See also [Windows Container Version Compatibility](https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/version-compatibility).

### Windows Server 2019

Base image: `mcr.microsoft.com/windows/servercore:ltsc2019`

Built by Appveyor: [![Build status](https://ci.appveyor.com/api/projects/status/y0jvpgsrl00wqe5i?svg=true)](https://ci.appveyor.com/project/nuest/rocker-win)

Images:

- `nuest/rocker-win:ltsc2019-3.6.2`
- `nuest/rocker-win:ltsc2019-latest`
- `nuest/rocker-win:latest`

### Windows Server 2016

Base image: `microsoft/windowsservercore:ltsc2016`

Built by Appveyor: [![Build status](https://ci.appveyor.com/api/projects/status/y0jvpgsrl00wqe5i?svg=true)](https://ci.appveyor.com/project/nuest/rocker-win)

Images:

- `nuest/rocker-win:ltsc2016-3.4.4`
- `nuest/rocker-win:ltsc2016-3.5.3`
- `nuest/rocker-win:ltsc2016-latest`

###  Windows Server 1803

Base image: `microsoft/windowsservercore:1803`

Built by Travis CI: [![Build Status](https://travis-ci.org/nuest/rocker-win.svg?branch=master)](https://travis-ci.org/nuest/rocker-win)

Images:

- `nuest/rocker-win:1803-3.5.3`
- `nuest/rocker-win:1803-latest`

### R versions

Each minor version has it's own `Dockerfile` in a directory named as the version number, e.g. `3.5`.

_Images updates on Docker Hub are triggered manually._

## Build locally

Depending on the Windows Server/Windows 10 version you have, pick a suitable Dockerfile and build it:

```
docker build --tag rocker-win:3.6.2 --file ltsc2016/3.6.2/Dockerfile .
```

The CI configuration files `.travis.yml` and `appveyor.yml` contain more examples.

_On my personal Windows 10 Professional, I was able to build images using all the platform variants (`ltsc2019`, `ltsc206`, and `1803`)._

## Use

Remove the `nuest/` from image names to use locally built images.

```
docker run --rm -it nuest/rocker-win

# get a PowerShell in the container with a specific Windows and R version
docker run --rm -it nuest/rocker-win:ltsc2016-3.6.2 powershell.exe

# run Rscript
docker run --rm -it rocker-win Rscript.exe -e "1+1"
```

All images include [micro](https://micro-editor.github.io/) as a terminal-based text editor, see its [commands](https://github.com/zyedidia/micro/blob/master/runtime/help/commands.md) when you want to edit some files within the container.

## Demos and use cases

Linux containers seem like the better way to go for R: they are more lightweight, the [Rocker](https://www.rocker-project.org/) stack of images is excellently maintained and hardened as well as flexible.
However, one potential use case is the deployment of R-based web applications alongside Windows containers in an organisation which already runs Windows Containers.
Instead of battling with the admin or operations teams, R developers may provide an alternative to get their work out.
The following demos showcase this use case with two popular web application frameworks for R, and demonstrates the easy use of packages for spatial analysis with complex library dependencies.

- [Plumber](demo/plumber/README.md)
- [Shiny](demo/shiny/README.md)
- [sf](demo/sf/README.md)

## Automated Builds

Depending on the available Windows installation (see [Windows Container Version Compatibility](https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/version-compatibility)), the following platforms support building of different Windows-based images.
The automated builds are partly for validating the Dockerfiles work, while some also deploy the images to Docker Hub.

### Docker Hub

The automatic image builds depend on Appveyor because [Docker Hub does not support Windows containers](https://docs.docker.com/docker-hub/builds/#limitations), at least [AFAIK](https://forums.docker.com/t/automated-windows-builds/24192/5).

### Building on Appveyor

[![Build status](https://ci.appveyor.com/api/projects/status/y0jvpgsrl00wqe5i?svg=true)](https://ci.appveyor.com/project/nuest/rocker-win)

[Appveyor runs Windows Server 2016 and 2019](https://www.appveyor.com/docs/windows-images-software/#operating-system) and supports different versions of Docker, including "experimental mode" for the latter one.

**2016**

Docker CE 18.05.0-ce for Windows and Linux, with docker-compose 1.16.1

Used base image in this repo: `microsoft/windowsservercore:ltsc2016`

**2019**

Docker CE 19.03.5 for Windows, wich docker-compose 1.24.1

Used base image in this repo: `mcr.microsoft.com/windows/servercore:ltsc2019`

_Note:_ This Appveyor image also has `mcr.microsoft.com/windows/servercore:ltsc2016` base images available, so the whole `ltsc2016` image stack could also be built here.

### Building on Travis CI

[![Build Status](https://travis-ci.org/nuest/rocker-win.svg?branch=master)](https://travis-ci.org/nuest/rocker-win)

Travis CI supports [Windows Server, version 1803](https://docs.travis-ci.com/user/reference/windows/)).
[`ltsc2016`-based image building fails](https://travis-ci.org/nuest/rocker-win/builds/446036668).

## Resources

- https://docs.docker.com/docker-for-windows/
- https://store.docker.com/search?operating_system=windows&q=&source=verified&type=image
- https://github.com/StefanScherer/dockerfiles-windows and https://hub.docker.com/r/stefanscherer
- https://stefanscherer.github.io/setup-windows-docker-ci-appveyor/
- https://stefanscherer.github.io/use-appveyor-to-build-multi-arch-docker-image/

## Contribute

_Your contributions are welcome!_
This repository really is mostly a proof-of-concept, but I'd be happy to support anyone who wants to turn this into a suite of images aspiring to the [Rocker Project](https://www.rocker-project.org/).

Note this project has a [Code of Conduct](CODE_OF_CONDUCT.md).

## License

Contributions in this repository are published under MIT license (see file LICENSE).
See file `C:\license.txt` in the container for the [Microsoft images and container license/EULA](https://docs.microsoft.com/en-us/virtualization/windowscontainers/images-eula).
