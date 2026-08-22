# OpenJDK base image

A headless OpenJDK 21 (LTS) base image built on `ubuntu:noble`.

_Please note that because of the changes to
[Docker Automated Builds](https://docs.docker.com/docker-hub/builds/) many Docker
images are now outdated and a manual build is required and recommended._

## Build

```sh
podman build --no-cache -t konstruktoid/java -f Dockerfile .
```

## Verify

```sh
$ podman run -ti --rm konstruktoid/java
openjdk version "21.0.11" 2026-04-21
OpenJDK Runtime Environment (build 21.0.11+10-1-24.04.2-Ubuntu)
OpenJDK 64-Bit Server VM (build 21.0.11+10-1-24.04.2-Ubuntu, mixed mode, sharing)
```

`JAVA_HOME` is set to `/usr/lib/jvm/java-21-openjdk-amd64` and the default
command is `java -version`.

`openjdk-21-jdk-headless` comes from the `noble` archive, so no third-party
repository or archive key is involved.

## Development

`.pre-commit-config.yaml` runs gitleaks, hadolint, actionlint and
markdownlint:

```sh
pre-commit run --all-files
```
