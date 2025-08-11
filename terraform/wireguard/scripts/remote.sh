#!/bin/bash

apt update
apt install curl wget iptables qrencode wireguard -y
wg genkey | tee /etc/wireguard/server_private_key | wg pubkey > /etc/wireguard/server_public_key
wg genkey | tee /etc/wireguard/client_private_key | wg pubkey > /etc/wireguard/client_public_key
chmod go= /etc/wireguard/server_private_key
chmod go= /etc/wireguard/client_private_key
cat > /etc/wireguard/wg0.conf <<EOF
[Interface]
PrivateKey = $(cat /etc/wireguard/server_private_key)
Address = 10.14.14.1/24

PostUp = iptables -t nat -I POSTROUTING 1 -s 10.14.14.0/24 -o eth0 -j MASQUERADE
PostUp = iptables -I INPUT 1 -i wg0 -j ACCEPT
PostUp = iptables -I FORWARD 1 -i eth0 -o wg0 -j ACCEPT
PostUp = iptables -I FORWARD 1 -i wg0 -o eth0 -j ACCEPT
PostUp = iptables -I INPUT 1 -i eth0 -p udp --dport 50000 -j ACCEPT

PostDown = iptables -t nat -D POSTROUTING -s 10.14.14.0/24 -o eth0 -j MASQUERADE
PostDown = iptables -D INPUT -i wg0 -j ACCEPT
PostDown = iptables -D FORWARD -i eth0 -o wg0 -j ACCEPT
PostDown = iptables -D FORWARD -i wg0 -o eth0 -j ACCEPT
PostDown = iptables -D INPUT -i eth0 -p udp --dport 50000 -j ACCEPT

ListenPort = 50000

[Peer]
PublicKey = $(cat /etc/wireguard/client_public_key)
AllowedIPs = 10.14.14.2/32
EOF
cat > /opt/peer_wg0.conf <<EOF
[Interface]
PrivateKey = $(cat /etc/wireguard/client_private_key)
Address = 10.14.14.2/32
DNS = $2

[Peer]
PublicKey = $(cat /etc/wireguard/server_public_key)
Endpoint = $1:50000
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
EOF
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
sysctl -p

systemctl enable wg-quick@wg0.service
systemctl start wg-quick@wg0.service

## SSH config changes
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
systemctl restart sshd
qrencode -t ansiutf8 < /opt/peer_wg0.conf
# reboot