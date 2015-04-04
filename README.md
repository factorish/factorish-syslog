# factorish/syslog

## About

A very simple `socat` based syslog server designed to listen to syslog on `TCP`, `UDP` or a UNIX socket `/tmp/syslog.sock` and print any messages to `stdout` so that they get picked up by the docker log system and can be accessed via tools like [logspout](http://github.com/gliderlabs/logspout).

## Usage

```
$ docker run -d factorish/syslog [-t tcp|udp|socket]
```

## Examples

Listen on TCP 5140 on host:

```
$ docker run -d -p 5140:514 factorish/syslog -t tcp
```

Listen on UDP 5140 on host:

```
$ docker run -d -p 5140:514/udp factorish/syslog -t udp
```

Listen on a socket which is volume mounted into another container:

```
$ docker run -d --name syslog -v /syslog/socket factorish/syslog -t socket
$ docker run -ti  --volumes-from syslog defensative/socat-ubuntu UNIX:/syslog/socket -
test
test
test
CTRL^C
$ docker logs syslog
==> syslog listening on socket
test
test
test
```
