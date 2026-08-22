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
podman run -ti --rm konstruktoid/java
```

That prints the OpenJDK version, which looks something like the block below.
The exact patch level, build number and date depend on what was current in the
`noble` archive when the image was built, so treat this as an example rather
than as expected output:

```text
openjdk version "21.0.x" <date>
OpenJDK Runtime Environment (build 21.0.x+nn-Ubuntu)
OpenJDK 64-Bit Server VM (build 21.0.x+nn-Ubuntu, mixed mode, sharing)
```

`JAVA_HOME` is set to `/usr/lib/jvm/java-21-openjdk-amd64` and the default
command is `java -version`.

`openjdk-21-jdk-headless` comes from the `noble` archive, so no third-party
repository or archive key is involved.

## Runtime user

The image runs as the dedicated `java` account, uid and gid `10001`, with
`/home/java` as the working directory. Nothing in it needs root, and no
capabilities have to be added:

```sh
podman run -ti --rm --cap-drop=all konstruktoid/java id
```

The uid and gid are fixed rather than allocated by the package manager, so a
volume mounted into a derived image can be `chown 10001:10001`ed on the host.

## Reproducibility

The base image is pinned by digest, so `FROM` always resolves to the same
layers. The Ubuntu packages installed on top of it are deliberately _not_
version pinned: the image exists to carry the newest patched OpenJDK, and
`apt-get upgrade` runs on every build. Two builds a week apart will therefore
contain different package versions and produce different image digests.

Dependabot moves the base image digest forward; nothing freezes the packages.
If you need a fixed set, build once and refer to the result by digest instead
of by tag.

## Development

`.pre-commit-config.yaml` runs gitleaks, hadolint, actionlint and
markdownlint:

```sh
pre-commit run --all-files
```
