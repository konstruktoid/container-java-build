FROM ubuntu:noble@sha256:224a1869083a311ef3f13648a154ba79832fbef6364d31493642ca03082da254

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
# The JDK is deliberately unpinned: the image exists to carry the newest
# patched OpenJDK build. See "Reproducibility" in README.md.
# hadolint ignore=DL3008
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

# Nothing here needs root, so the image ships a dedicated account rather than
# leaving it to whoever runs it. The uid and gid are fixed so a mounted volume
# can be chowned to them on the host.
RUN groupadd --system --gid 10001 java && \
    useradd --system --uid 10001 --gid 10001 \
      --home-dir /home/java --create-home --shell /usr/sbin/nologin java

WORKDIR /home/java

USER 10001:10001

CMD ["java", "-version"]
