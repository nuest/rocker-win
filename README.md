# rocker-win

Explorations into running [R](https://www.r-project.org/) in [Windows Containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index) with [Docker for Windows](https://docs.docker.com/docker-for-windows/).
It provides images based on [`microsoft/windowsservercore`](https://hub.docker.com/r/microsoft/windowsservercore/) and [`microsoft/nanoserver`](https://hub.docker.com/r/microsoft/nanoserver/).

[![](https://images.microbadger.com/badges/image/nuest/rocker-win.svg)](https://microbadger.com/images/nuest/rocker-win "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/nuest/rocker-win.svg)](https://microbadger.com/images/nuest/rocker-win "Get your own version badge on microbadger.com")

## Build

```
docker build --tag rocker-win:3.4.3 rocker-win:latest --file 3.4.3/Dockerfile .
docker build --tag rocker-win:3.4.3-nano --tag rocker-win:nano --tag rocker-win:nano-latest --file 3.4.3-nano/Dockerfile .
```

## Use

```
docker run --rm -it rocker-win

docker run --rm -it rocker-win:nano

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
The following demos showcase this use case with two popular web application frameworks for R.

- [Plumber](demo/plumber/README.md)
- [Shiny](demo/shiny/README.md)

## Resources

- https://docs.docker.com/docker-for-windows/
- https://store.docker.com/search?operating_system=windows&q=&source=verified&type=image
- https://github.com/StefanScherer/dockerfiles-windows and https://hub.docker.com/r/stefanscherer
- https://stefanscherer.github.io/setup-windows-docker-ci-appveyor/

## License

Contributions in this repository are published under MIT license (see file LICENSE).
See file `C:\license.txt` in the container for the [Microsoft images and container license/EULA](https://docs.microsoft.com/en-us/virtualization/windowscontainers/images-eula).
