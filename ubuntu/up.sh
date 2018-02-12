#!/usr/bin/env bash

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
echo "source-file $(pwd)/../.tmux.conf" | sudo tee -a $(pwd)/tmux.conf

## vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# FINISH

## dirs 
mkdir ~/.ssh
mkdir -p ~/.vim/tmp

## symlinks
ln -s ~/Dropbox/.gitconfig ~/.gitconfig
ln -s ~/Dropbox/.ssh/config ~/.ssh/config
ln -s $(pwd)/../.agignore ~/.agignore
ln -s $(pwd)/../.inputrc ~/.agignore
ln -s $(pwd)/../.vimrc ~/.vimrc
ln -s $(pwd)/../.zshrc ~/.zshrc
ln -s $(pwd)/tmux.conf ~/.tmux.conf
