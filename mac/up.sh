#!/usr/bin/env bash

BREW="https://raw.githubusercontent.com/Homebrew/install/master/install"
DIR="$(pwd)/$(dirname $0)"

# INSTALL 

## brew
if ! [ -x "$(command -v brew)" ]; then
  ruby -e "$(curl -fsSL ${BREW})"
fi

brew cask install xquartz

brew install \
  automake \
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
  react-native-cli \
  uglify-js \
  yarn

## ruby
gem install colorls pry sass

## shell
if ! grep -Fxq "/usr/local/bin/zsh" /etc/shells
then
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/zsh
fi

## tmux
function tmux_append {
  echo $1 | sudo tee -a $DIR/../.tmux.conf
}

if [ ! -f $DIR/../.tmux.conf ]; then
  tmux_append "bind-key -Tcopy-mode-vi 'v' send -X begin-selection"
  tmux_append "bind-key -Tcopy-mode-vi 'y' send -X copy-selection"
  tmux_append "source-file $DIR/../tmux.conf"
fi

## vim
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# FINISH

## dirs 
if [ ! -d ~/.ssh ]; then
  mkdir ~/.ssh
fi

if [ ! -d ~/.vim/tmp ]; then
  mkdir -p ~/.vim/tmp
fi

## symlinks
ln -sf $DIR/bootup /usr/local/bin/bootup
sudo ln -sf $DIR/com.user.bootup.plist \
  /Library/LaunchDaemons/com.user.bootup.plist

ln -sf ~/Dropbox/.gitconfig ~/.gitconfig
ln -sf ~/Dropbox/.ssh/config ~/.ssh/config
ln -sf $DIR/../agignore ~/.agignore
ln -sf $DIR/../inputrc ~/.inputrc
ln -sf $DIR/../vimrc ~/.vimrc
ln -sf $DIR/../zshrc ~/.zshrc
ln -sf $DIR/../.tmux.conf ~/.tmux.conf
