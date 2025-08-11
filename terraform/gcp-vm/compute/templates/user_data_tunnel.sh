#!/bin/bash

if [[ $(uname -a) =~ "Debian" ]]; then
  sudo apt update
  sudo apt install wireguard -y
  sudo wg genkey | tee /etc/wireguard/server_private_key | sudo wg pubkey > /etc/wireguard/server_public_key
  sudo wg genkey | tee /etc/wireguard/client_private_key | sudo wg pubkey > /etc/wireguard/client_public_key
  sudo chmod go= /etc/wireguard/server_private_key
  sudo chmod go= /etc/wireguard/client_private_key
  sudo cat > /etc/wireguard/wg0.conf <<EOF
[Interface]
PrivateKey = $(cat /etc/wireguard/server_private_key)
Address = 10.13.13.1/24

PostUp = iptables -t nat -I POSTROUTING 1 -s 10.13.13.0/24 -o enX0 -j MASQUERADE
PostUp = iptables -I INPUT 1 -i wg0 -j ACCEPT
PostUp = iptables -I FORWARD 1 -i enX0 -o wg0 -j ACCEPT
PostUp = iptables -I FORWARD 1 -i wg0 -o enX0 -j ACCEPT
PostUp = iptables -I INPUT 1 -i enX0 -p udp --dport 51820 -j ACCEPT
#Forwarding 443 from peer
# PostUp = iptables -t nat -A PREROUTING -p tcp -i enX0 --dport 443 -j DNAT --to 10.13.13.2:443

PostDown = iptables -t nat -D POSTROUTING -s 10.13.13.0/24 -o enX0 -j MASQUERADE
PostDown = iptables -D INPUT -i wg0 -j ACCEPT
PostDown = iptables -D FORWARD -i enX0 -o wg0 -j ACCEPT
PostDown = iptables -D FORWARD -i wg0 -o enX0 -j ACCEPT
PostDown = iptables -D INPUT -i enX0 -p udp --dport 51820 -j ACCEPT

# PostDown = iptables -t nat -D PREROUTING -p tcp -i enX0 --dport 443 -j DNAT --to 10.13.13.2:443

ListenPort = 51820

[Peer]
PublicKey = $(cat /etc/wireguard/client_public_key)
AllowedIPs = 10.13.13.2/32
EOF
  sudo cat > /opt/peer_wg0.conf <<EOF
[Interface]
PrivateKey = $(cat /etc/wireguard/client_private_key)
Address = 10.13.13.2/32
DNS = 10.13.13.1

[Peer]
PublicKey = $(cat /etc/wireguard/server_public_key)
Endpoint = $(curl ifconfig.me):51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
EOF
  sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
  sudo sysctl -p

  sudo systemctl enable wg-quick@wg0.service
  sudo systemctl start wg-quick@wg0.service

  sudo apt update
  curl -sL https://get.docker.com | sudo sh
  getent group docker || sudo groupadd docker
  sudo usermod -aG docker admin

  sudo reboot
fi