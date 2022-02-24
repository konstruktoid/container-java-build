# OpenJDK base image

_Please note that because of the changes to [Docker Automated Builds](https://docs.docker.com/docker-hub/builds/)
many Docker images are now outdated and a manual build is required and recommended._

```sh
$ docker build --no-cache -t konstruktoid/java -f Dockerfile .
$ docker run -ti --rm konstruktoid/java java -version
openjdk version "11.0.13" 2021-10-19
OpenJDK Runtime Environment (build 11.0.13+8-Ubuntu-0ubuntu1.20.04)
OpenJDK 64-Bit Server VM (build 11.0.13+8-Ubuntu-0ubuntu1.20.04, mixed mode, sharing)
```
