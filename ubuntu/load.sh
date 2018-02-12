#!/usr/bin/env bash

REPO="https://github.com/simplystuart/dotfiles.git"

printf "server IP: "
read ip

ssh-copy-id root@$ip
scp ~/.gitconfig root@$ip:~/
ssh -t root@$ip "apt update \
  && apt install -y git \
  && git clone $REPO \
  && ./dotfiles/ubuntu/up.sh \
"
