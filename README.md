# OpenJDK base image

```sh
$ docker build --no-cache -t konstruktoid/java -f Dockerfile .
$ docker run -ti --rm konstruktoid/java java -version
openjdk version "11.0.1" 2018-10-16
OpenJDK Runtime Environment (build 11.0.1+13-Ubuntu-3ubuntu118.04ppa1)
OpenJDK 64-Bit Server VM (build 11.0.1+13-Ubuntu-3ubuntu118.04ppa1, mixed mode, sharing)
```
