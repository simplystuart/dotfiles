#!/usr/bin/env bash

BREW="https://raw.githubusercontent.com/Homebrew/install/master/install"
DIR="$(pwd)/$(dirname $0)"

# INSTALL 

## brew
ruby -e "$(curl -fsSL ${BREW})"

cask install xquartz

brew install \
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
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

## tmux
function tmux_append {
  echo $1 | sudo tee -a $DIR/../.tmux.conf
}
tmux_append "bind-key -Tcopy-mode-vi 'v' send -X begin-selection"
tmux_append "bind-key -Tcopy-mode-vi 'y' send -X copy-selection"
tmux_append "source-file $DIR/../tmux.conf"

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

ln -sf ~/Dropbox/.gitconfig ~/.gitconfig
ln -sf ~/Dropbox/.ssh/config ~/.ssh/config
ln -sf $DIR/../agignore ~/.agignore
ln -sf $DIR/../inputrc ~/.inputrc
ln -sf $DIR/../vimrc ~/.vimrc
ln -sf $DIR/../zshrc ~/.zshrc
ln -sf $DIR/../.tmux.conf ~/.tmux.conf
