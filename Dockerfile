FROM konstruktoid/ubuntu:focal

RUN \
    apt-get -y update && \
    apt-get -y install gnupg --no-install-recommends && \
    apt-get update && \
    apt-get -y install openjdk-11-jdk-headless --no-install-recommends && \
    apt-get -y purge gnupg && \
    apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* \
      /usr/share/doc /usr/share/doc-base \
      /usr/share/man /usr/share/locale /usr/share/zoneinfo
