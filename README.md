# rocker-win

Explorations into running [R](https://www.r-project.org/) in [Windows Containers](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/index) with [Docker for Windows](https://docs.docker.com/docker-for-windows/).

[![](https://images.microbadger.com/badges/image/nuest/rocker-win.svg)](https://microbadger.com/images/nuest/rocker-win "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/nuest/rocker-win.svg)](https://microbadger.com/images/nuest/rocker-win "Get your own version badge on microbadger.com")

## Build

```
docker build --tag rocker-win:3.4.3 rocker-win:latest --file 3.4.3/Dockerfile .
```

## Use

```
docker run --rm -it rocker-win

# get a powershell in the container
docker run --rm -it rocker-win powershell.exe

# run Rscript
docker run --rm -it rocker-win Rscript.exe -e "1+1"
```

The images include [micro](https://micro-editor.github.io/) as a terminal-based text editor, see its [commands](https://github.com/zyedidia/micro/blob/master/runtime/help/commands.md) when you want to edit some files within the container.

## Resources

- https://docs.docker.com/docker-for-windows/
- https://store.docker.com/search?operating_system=windows&q=&source=verified&type=image
- https://github.com/StefanScherer/dockerfiles-windows and https://hub.docker.com/r/stefanscherer
- https://stefanscherer.github.io/setup-windows-docker-ci-appveyor/

## License

Contributions in this repository are published under MIT license (see file LICENSE).
See file `C:\license.txt` in the container for the [Microsoft images and container license/EULA](https://docs.microsoft.com/en-us/virtualization/windowscontainers/images-eula).
