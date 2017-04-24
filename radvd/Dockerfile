FROM alpine:latest
MAINTAINER "John Koelndorfer <jkoelndorfer@gmail.com>"

RUN apk add --no-cache radvd

VOLUME ["/etc/radvd.conf"]
ENTRYPOINT ["/usr/sbin/radvd", "-n"]
