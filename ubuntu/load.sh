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

echo "upgrade script done..."

printf "colorscheme: "
read colorscheme

ssh -t root@$ip "zsh ~/.zshrc base16_materia"

echo "done!"
