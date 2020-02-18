# OpenJDK base image

```sh
$ docker build --no-cache -t konstruktoid/java -f Dockerfile .
$ docker run -ti --rm konstruktoid/java java -version
openjdk version "11.0.6" 2020-01-14
OpenJDK Runtime Environment (build 11.0.6+10-post-Ubuntu-1ubuntu118.04.1)
OpenJDK 64-Bit Server VM (build 11.0.6+10-post-Ubuntu-1ubuntu118.04.1, mixed mode, sharing)
```
