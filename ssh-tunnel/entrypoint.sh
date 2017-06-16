#!/bin/sh

echo "$AUTHORIZED_KEY" > ~tunnel/.ssh/authorized_keys

for key_type in rsa ecdsa ed25519; do
    key_path="/etc/ssh/host_keys/ssh_host_${key_type}_key"
    [[ -f "$key_path" ]] && continue
    ssh-keygen -C '' -N '' -t "$key_type" -f "$key_path"
done

exec /usr/sbin/sshd -D
