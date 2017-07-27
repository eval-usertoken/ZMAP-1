FROM debian:stretch
MAINTAINER Karl Bateman <karl.bateman@oxheyhall.com>

LABEL Name="ATLAS"
LABEL Version="1.0.0"

RUN apt-get update
RUN apt-get install --yes build-essential \
                  cmake \
                  libgmp3-dev \
                  gengetopt \
                  libpcap-dev \
                  flex \
                  byacc \
                  libjson-c-dev \
                  pkg-config \
                  libunistring-dev \
                  arping \
                  iproute2
                  
RUN apt-get install --yes zmap
RUN mkdir -p /usr/src/zmap
WORKDIR /usr/src/zmap

ADD ./zmap-wrapper /usr/local/bin/

ENTRYPOINT ["zmap-wrapper"]
