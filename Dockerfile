FROM konstruktoid/ubuntu:bionic

RUN \
    apt-get -y update && \
    apt-get -y install gnupg --no-install-recommends && \
    echo 'deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu bionic main' | tee /etc/apt/sources.list.d/openjdk.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DA1A4A13543B466853BAF164EB9B1D8886F44E2A && \
    apt-get update && \
    apt-get -y install openjdk-11-jdk-headless --no-install-recommends && \
    apt-get -y purge gnupg && \
    apt-get -y clean && \
    apt-get -y autoremove

RUN \
    rm -rf /var/lib/apt/lists/* \
      /usr/share/doc /usr/share/doc-base \
      /usr/share/man /usr/share/locale /usr/share/zoneinfo
