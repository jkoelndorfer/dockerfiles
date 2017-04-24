FROM alpine:latest
MAINTAINER "John Koelndorfer <jkoelndorfer@gmail.com>"

RUN apk add --no-cache dnsmasq && rm -f /etc/dnsmasq.conf

EXPOSE 53/udp
VOLUME ["/etc/dnsmasq.conf"]
ENTRYPOINT ["/usr/sbin/dnsmasq", "-d"]
