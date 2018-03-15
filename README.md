# rocker-win

Explorations into [R]() in [Windows Docker cntainers]().

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

## Resources

- https://store.docker.com/search?operating_system=windows&q=&source=verified&type=image
- https://github.com/StefanScherer/dockerfiles-windows and https://hub.docker.com/r/stefanscherer
- https://stefanscherer.github.io/

## License

MIT
