#!/usr/bin/env bash

CRONTAB=$(crontab -u root -l)
DIR="$(pwd)/$(dirname $0)"

# INSTALL

## apt
add-apt-repository ppa:jonathonf/vim -y

apt update && apt upgrade -y && apt full-upgrade -y && apt install -y \
  automysqlbackup \
  build-essential \
  htop \
  imagemagick \
  libffi-dev/xenial \
  nodejs-legacy \
  npm \
  ruby-dev \
  silversearcher-ag \
  software-properties-common \
  tmux \
  wget \
  vim \
  zsh

## certbot
CRON="30 2 * * 1 certbot renew"

if [[ ! $CRONTAB = *"$CRON"* ]]; then
  add-apt-repository -y ppa:certbot/certbot \
    && apt update \
    && apt install -y python-certbot-apache

  printf "$CRONTAB\n$CRON\n" | crontab -u root -
fi

## colors
if [ ! -f ~/.config/base16-shell ]; then
  git clone https://github.com/chriskempson/base16-shell.git \
    ~/.config/base16-shell
fi

## iterm2
if [ ! -f ~/.iterm2_shell_integration ]; then
  curl -L https://iterm2.com/shell_integration/zsh \
    -o ~/.iterm2_shell_integration.zsh
fi

## npm
npm install -g \
  clean-css-cli \
  elm \
  elm-css \
  elm-format \
  elm-github-install \
  elm-oracle \
  elm-test \
  prettier \
  react-native-cli \
  uglify-js \
  yarn

## php
add-apt-repository ppa:ondrej/php -y
apt update
apt remove php7.0
apt install -y php7.2
apt install -y php-mysql

## ruby
gem install colorls pry sass

## shell
if ! grep -Fxq $(which zsh) /etc/shells
then
  echo $(which zsh) | sudo tee -a /etc/shells
  sudo chsh -s $(which zsh)
  exec zsh -l
fi

## tmux
function tmux_append {
  echo $1 | sudo tee -a $DIR/../.tmux.conf
}

if [ ! -f $DIR/../.tmux.conf ]; then
  tmux_append "bind-key -t vi-copy v begin-selection"
  tmux_append "bind-key -t vi-copy y copy-pipe \"xclip -sel clip -i\""
  tmux_append "source-file $DIR/../tmux.conf"
fi

## vim
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim -c :so ~/.vimrc -c :qa
  vim -c :PlugInstall -c :qa
fi

# FINISH

## cron
CRON="0 0 * * * cd $DIR/../ && git pull origin master >/dev/null 2>&1"

if [[ ! $CRONTAB = *"$CRON"* ]]; then
  printf "$CRONTAB\n$CRON\n" | crontab -u root -
fi

## dirs 
if [ ! -d ~/.vim/tmp ]; then
  mkdir -p ~/.vim/tmp
fi

## symlinks
ln -sf $DIR/../agignore ~/.agignore
ln -sf $DIR/../inputrc ~/.inputrc
ln -sf $DIR/../vimrc ~/.vimrc
ln -sf $DIR/../zshrc ~/.zshrc
ln -sf $DIR/../.tmux.conf ~/.tmux.conf

## zsh
exec $(which zsh) -l
