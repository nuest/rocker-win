# rocker-win

Explorations into running [R](https://www.r-project.org/) in [Windows Containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index) with [Docker for Windows](https://docs.docker.com/docker-for-windows/).
It provides images based on [`microsoft/windowsservercore`](https://hub.docker.com/r/microsoft/windowsservercore/) and [`microsoft/nanoserver`](https://hub.docker.com/r/microsoft/nanoserver/).

[![Build status](https://ci.appveyor.com/api/projects/status/y0jvpgsrl00wqe5i?svg=true)](https://ci.appveyor.com/project/nuest/rocker-win) [![](https://images.microbadger.com/badges/image/nuest/rocker-win.svg)](https://microbadger.com/images/nuest/rocker-win "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/nuest/rocker-win.svg)](https://microbadger.com/images/nuest/rocker-win "Get your own version badge on microbadger.com")

## Available images

This little side-project is currently for exploration only, therefore not all bugfix versions of R are re-build regularly.
Each minor version has it's own `Dockerfile` in a directory named as the version number, e.g. `3.5`.

_Images updates on Docker Hub are triggered manually._

## Build locally

```
docker build --tag rocker-win:3.5.1 --file 3.5.1/Dockerfile .
```

## Use

Prepend `nuest/` to image names to use pre-built images from Docker Hub.

```
docker run --rm -it rocker-win

# get a PowerShell in the container
docker run --rm -it rocker-win powershell.exe

# run Rscript
docker run --rm -it rocker-win Rscript.exe -e "1+1"
```

The images include [micro](https://micro-editor.github.io/) as a terminal-based text editor, see its [commands](https://github.com/zyedidia/micro/blob/master/runtime/help/commands.md) when you want to edit some files within the container.

## Demos and use cases

Linux containers seem like the better way to go for R: they are more lightweight, the [Rocker](https://www.rocker-project.org/) stack of images is excellently maintained and hardened as well as flexible.
However, one potential use case is the deployment of R-based web applications alongside Windows containers in an organisation which already runs Windows Containers.
Instead of battling with the admin or operations teams, R developers may provide an alternative to get their work out.
The following demos showcase this use case with two popular web application frameworks for R, and demonstrates the easy use of packages for spatial analysis with complex library dependencies.

- [Plumber](demo/plumber/README.md)
- [Shiny](demo/shiny/README.md)
- [sf](demo/sf/README.md)

## Building on Appveyor

The automatic image builds depend on Appveyor because [Docker Hub does not support Windows containers](https://docs.docker.com/docker-hub/builds/#limitations).
[Appveyor runs Windows Server 2016](https://www.appveyor.com/docs/windows-images-software/#operating-system) (and so does [Travis CI](https://docs.travis-ci.com/user/reference/windows/)) so the base image can also only be Windows Server 2016 (see [Windows Container Version Compatibility](https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/version-compatibility)). i.e. `microsoft/windowsservercore:ltsc2016`.

## Resources

- https://docs.docker.com/docker-for-windows/
- https://store.docker.com/search?operating_system=windows&q=&source=verified&type=image
- https://github.com/StefanScherer/dockerfiles-windows and https://hub.docker.com/r/stefanscherer
- https://stefanscherer.github.io/setup-windows-docker-ci-appveyor/

## License

Contributions in this repository are published under MIT license (see file LICENSE).
See file `C:\license.txt` in the container for the [Microsoft images and container license/EULA](https://docs.microsoft.com/en-us/virtualization/windowscontainers/images-eula).
