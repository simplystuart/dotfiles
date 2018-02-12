#!/usr/bin/env bash

DIR="$(pwd)/$(dirname $0)"

# INSTALL 

## apt-get
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y \
  build-essential \
  git \
  htop \
  nodejs \
  ruby \
  silversearcher-ag \
  tmux \
  wget \
  vim \
  zsh

## colors
/usr/local/bin/git clone https://github.com/chriskempson/base16-shell.git \
  ~/.config/base16-shell

## npm
/user/local/bin/npm install -g \
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

# FINISH

## dirs 
mkdir ~/.ssh
mkdir -p ~/.vim/tmp

## symlinks
ln -sf $DIR/../agignore ~/.agignore
ln -sf $DIR/../inputrc ~/.inputrc
ln -sf $DIR/../vimrc ~/.vimrc
ln -sf $DIR/../zshrc ~/.zshrc
ln -sf $DIR/../.tmux.conf ~/.tmux.conf
