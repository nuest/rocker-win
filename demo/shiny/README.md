# rocker-win demo: Shiny

## About

[Shiny](http://shiny.rstudio.com/) is _"is an R package that makes it easy to build interactive web apps straight from R"_.

## Build and run

```
docker build --tag shiny-win .

docker run --rm -it -p 4343:4343 shiny-win
```

## Use

Open http://localhost:4343 in your browser.

## What next?

Find more example apps at http://shiny.rstudio.com/tutorial/written-tutorial/lesson1/ and change the `CMD` in the Dockerfile or in the run statement (no spaces!) to try them out.

```
docker run --rm -it -p 4343:4343 shiny-win -e "runExample('03_reactivity',port=4343)"
```