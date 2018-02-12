#!/usr/bin/env bash

BREW="https://raw.githubusercontent.com/Homebrew/install/master/install"
DIR="$(pwd)/$(dirname $0)"

# INSTALL 

## brew
/usr/bin/ruby -e "$(curl -fsSL ${BREW})"

/usr/local/bin/cask install xquartz

/usr/local/bin/brew install \
  ffmpeg \
  git \
  mysql \
  ncftp \
  node \
  postgresql \
  python3 \
  rbenv \
  reattach-to-user-namespace \
  ruby \
  ruby-build \
  shpotify \
  ssh-copy-id \
  the_silver_searcher \
  tmux \
  vim \
  watch \
  watchman \
  wget \
  wine \
  youtube-dl \
  zsh

## colors
/usr/local/bin/git clone https://github.com/chriskempson/base16-shell.git \
  ~/.config/base16-shell

## iterm2
curl -L https://iterm2.com/shell_integration/zsh \
  -o ~/.iterm2_shell_integration.zsh

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
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

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
ln -s $DIR/bootup /usr/local/bin/bootup
sudo ln -s $DIR/com.user.bootup.plist \
  /Library/LaunchDaemons/com.user.bootup.plist

ln -s ~/Dropbox/.gitconfig ~/.gitconfig
ln -s ~/Dropbox/.ssh/config ~/.ssh/config
ln -s $DIR/../agignore ~/.agignore
ln -s $DIR/../inputrc ~/.inputrc
ln -s $DIR/../vimrc ~/.vimrc
ln -s $DIR/../zshrc ~/.zshrc
ln -s $DIR/../tmux.conf ~/.tmux.conf
