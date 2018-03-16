# rocker-win demo: Plumber

## About

[Plumber](https://www.rplumber.io/) is an _"R package that converts your existing R code to a web API using a handful of special one-line comments."_

## Build and run

Run the following commands in the directory of this file to build and run a small example app in a Windows Container.

```
docker build --tag plumber-win .

docker run --rm -it -p 8000:8000 plumber-win
```

## Use

Now visit the following URLs in your browser to see the mean of 10 random numbers: http://localhost:8000/mean

Or run the following command in PowerShell to send two numbers to the service with HTTP POST and retrieve the sum:

`Invoke-WebRequest -UseBasicParsing -Uri http://localhost:8000/sum -Method POST -Body @{a='5';b='2'}`

Look for the `[7]` in the `RawContent` section.

In the Dockerfile the default command starts an R script, which is added to the image wit `COPY`.
The script creates a Plumber server based on an API definition script included in the installed R package.

Alternatively you might use [a combination of](https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact) `ENTRYPOINT` and `CMD` to run different Plumber API implementations.

## What next?

- You can run more plumber examples by selecting a differnt file in `start.R`, e.g. `C:/R/library/plumber/examples/11-car-inventory/plumber.R` to run [this API](https://github.com/trestletech/plumber/blob/master/inst/examples/11-car-inventory/plumber.R). You must also adjust the working directory to `.../11-car-inventory`, because R on Windows resolves paths differently. Then re-build the container and open http://localhost:8000/car/ 
- Write your own API and start script, [bind mount](https://docs.docker.com/storage/bind-mounts/) them into the container, and run it from there, e.g. in PowerShell `docker run --rm -it -p 8000:8000 -v ${PWD}:C:\demo plumber-win C:\demo\api_start.R` (in `cmd` the current directory is `%cd%`). Open http://localhost:8000/echo?msg=Hello! or http://localhost:8000/plot or http://localhost:8000/platform.
- You can run `docker run --rm -it -p 8000:8000 --entrypoint R.exe plumber-win` to get an R session inside the container and manually start your API.
- Start multiple API endpoints under different ports by adjusting the `-p` parameter.