FROM ubuntu:latest

MAINTAINER Mark J. Becker <mjb@marb.ec>

ENV PHANTOMJS_VERSION=1.9.8

RUN apt-get update && apt-get install -y --no-install-recommends \
	wget \
	libfreetype6 \
	libfontconfig \
	&& rm -rf /var/lib/apt/lists/*

RUN wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 \
	&& tar -C /tmp -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 \
	&& ln -s /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /usr/bin/phantomjs \
	&& rm /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2

RUN mkdir -p /raster-root \
	&& mkdir -p /raster-output
COPY rasterize.js /raster-root/
WORKDIR /raster-root

ENTRYPOINT ["phantomjs", "--ignore-ssl-errors=yes", "/raster-root/rasterize.js"]