FROM nuest/rocker-win

RUN ["R.exe", "-e", "install.packages('shiny')"]

EXPOSE 4343

ENTRYPOINT [ "Rscript.exe", "-e", "options('shiny.host'='0.0.0.0')", "-e", "library('shiny')" ]
CMD ["-e", "runExample('01_hello',port=4343)"]
