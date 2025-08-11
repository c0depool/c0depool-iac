#!/bin/bash

if [[ $(uname -a) =~ "Debian" ]]; then
  sudo apt update
  curl -sL https://get.docker.com | sudo sh
  getent group docker || sudo groupadd docker
  sudo usermod -aG docker admin
fi