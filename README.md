# Java base image

```sh
$ docker build -t debian:java -f Dockerfile .
$ docker run -ti --rm debian:java java -version
java version "1.8.0_60"
Java(TM) SE Runtime Environment (build 1.8.0_60-b27)
Java HotSpot(TM) 64-Bit Server VM (build 25.60-b23, mixed mode)
```
