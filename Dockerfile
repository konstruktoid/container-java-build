FROM ubuntu:noble@sha256:d78ab76437b1afc5f01e223d6bf0172763f404bb166441328845adbef44518cb

LABEL org.opencontainers.image.title="java" \
      org.opencontainers.image.description="Headless OpenJDK 21 base image" \
      org.opencontainers.image.authors="Thomas Sjögren <konstruktoid@users.noreply.github.com>" \
      org.opencontainers.image.source="https://github.com/konstruktoid/container-java-build" \
      org.opencontainers.image.url="https://hub.docker.com/r/konstruktoid/java" \
      org.opencontainers.image.base.name="docker.io/library/ubuntu:noble"

ARG DEBIAN_FRONTEND=noninteractive
ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
ENV LANG=C.UTF-8

# openjdk-21 is the current LTS in the noble archive, so no third-party
# repository or key handling is needed.
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install --no-install-recommends \
      ca-certificates \
      openjdk-21-jdk-headless && \
    apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
      /usr/share/doc /usr/share/doc-base \
      /usr/share/man /usr/share/locale /usr/share/zoneinfo

CMD ["java", "-version"]
