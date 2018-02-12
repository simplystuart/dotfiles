#!/usr/bin/env bash

CERTBOTCRON="30 2 * * 1 certbot renew"
DIR="$(pwd)/$(dirname $0)"

# INSTALL 

## apt
apt update && apt upgrade -y && apt full-upgrade -y && apt install -y \
  automysqlbackup \
  build-essential \
  htop \
  libffi-dev/xenial \ # for sass gem
  nodejs-legacy
  npm \
  ruby-dev \
  silversearcher-ag \
  software-properties-common \
  tmux \
  wget \
  vim \
  zsh

## certbot
add-apt-repository -y ppa:certbot/certbot \
  && apt-update \
  && apt install -y add-apt-repository ppa:certbot/certbot

printf "$(crontab -u root -l)\n$CERTBOTCRON\n" | crontab -u root -

## colors
git clone https://github.com/chriskempson/base16-shell.git \
  ~/.config/base16-shell

## iterm2
curl -L https://iterm2.com/shell_integration/zsh \
  -o ~/.iterm2_shell_integration.zsh

## npm
npm install -g \
  clean-css-cli \
  elm \
  elm-css \
  elm-format \
  elm-github-install \
  elm-oracle \
  elm-test \
  react-native-cli \
  uglify-js \
  yarn

## ruby
gem install colorls pry sass

## shell
echo "/usr/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/bin/zsh

## tmux
function tmux_append {
  echo $1 | sudo tee -a $DIR/../.tmux.conf
}
tmux_append "bind-key -t vi-copy v begin-selection"
tmux_append "bind-key -t vi-copy y copy-pipe \"xclip -sel clip -i\""
tmux_append "source-file $DIR/../tmux.conf"

## vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c :PlugInstall -c :qa

# FINISH

## dirs 
mkdir -p ~/.vim/tmp

## symlinks
ln -sf $DIR/../agignore ~/.agignore
ln -sf $DIR/../inputrc ~/.inputrc
ln -sf $DIR/../vimrc ~/.vimrc
ln -sf $DIR/../zshrc ~/.zshrc
ln -sf $DIR/../.tmux.conf ~/.tmux.conf
