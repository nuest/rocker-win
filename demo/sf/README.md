# rocker-win demo: sf

Thanks to the hard work by [Jeroen Ooms](https://github.com/jeroen), [Edzer Pebesma](https://github.com/edzer), [Roger Bivand](https://github.com/rsbivand), and others, installing the [`sf`](https://cran.r-project.org/package=sf) package and all its dependencies (`rgdal`, `lwgeom`) on Windows is very easy with precompiled binaries.

## Build

```
docker build --tag sf-win .
```

## Use

```
docker run --rm -it sf-win R.exe -q -e "library('sf')"
```

**Output:**

```
library('lwgeom');library('sf')
Linking to liblwgeom 2.5.0dev r16016, GEOS 3.6.1, proj.4 4.9.3
Linking to GEOS 3.6.1, GDAL 2.2.0, proj.4 4.9.3
```
