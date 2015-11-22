# docker-rasterize
Docker Container of PhantomJS's rasterize.js

# Usage
```
docker run -it --rm -v /output:/raster-output herzog31/rasterize http://marb.ec marbec.png 1980px*1080px 1.0
```

The output file `marbec.png` is stored in the `/output` folder of your Docker host.

For more information, take a look at the [Screen Capture](http://phantomjs.org/screen-capture.html) guide of PhantomJS.