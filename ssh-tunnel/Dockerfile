FROM alpine:3.6
MAINTAINER John Koelndorfer <jkoelndorfer@gmail.com>

RUN apk update && apk add openssh-server
RUN sed -i -e 's!^#HostKey /etc/ssh!HostKey /etc/ssh/host_keys!' /etc/ssh/sshd_config && sed -i -e '/host_dsa_key/d' /etc/ssh/sshd_config
RUN adduser -u 500 -D tunnel && mkdir ~tunnel/.ssh
ADD entrypoint.sh /entrypoint.sh

VOLUME ["/etc/ssh/host_keys"]
CMD ["/entrypoint.sh"]
