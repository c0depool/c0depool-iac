#!/bin/bash

## Adguard Home installation

apt update && apt upgrade -y

wget --no-verbose -O - https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v

cp /tmp/AdGuardHome.yaml /opt/AdGuardHome/AdGuardHome.yaml

systemctl restart AdGuardHome.service
rm -rf /tmp/AdGuardHome.yaml

## SSH config changes
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
systemctl restart sshd