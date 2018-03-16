FROM nuest/rocker-win

RUN ["R.exe", "-e", "install.packages('plumber')"]

COPY start.R start.R

EXPOSE 8000

ENTRYPOINT [ "Rscript.exe" ]
CMD ["C:\\start.R"]
