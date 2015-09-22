FROM konstruktoid/debian:wheezy

RUN \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install openjdk-7-jre-headless libjna-java --no-install-recommends && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* \
      /usr/share/doc /usr/share/doc-base \
      /usr/share/man /usr/share/locale /usr/share/zoneinfo
