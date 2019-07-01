#!/usr/bin/env bash

dotfiles="//raw.githubusercontent.com/simplystuart/dotfiles/master/"

# CREATE DIRECTORIES

if [ ! -d ~/.config ]; then
	echo "Creating empty .config dir..."
	mkdir -p ~/.config
fi

if [ ! -d ~/.config/nvim ]; then
	echo "Creating empty .config/nvim dir..."
	mkdir -p ~/.config/nvim
fi

if [ ! -d ~/.ssh ]; then
	echo "Creating empty .ssh dir..."
	mkdir ~/.ssh
fi

if [ ! -d ~/.vim/tmp ]; then
	echo "Creating empty .vim/tmp dir..."
	mkdir -p ~/.vim/tmp
fi

if [ ! -d ~/Projects ]; then
	echo "Creating empty Projects dir..."
	mkdir ~/Projects
fi

# CLONE DOTFILES PROJECT

echo "Cloning dotfiles project..."
cd ~/Projects
git clone https://github.com/simplystuart/dotfiles.git
cd ..

# RUN SCRIPTS

echo "Running brew script..."
sh -c "$(curl -fsSL ${dotfiles}brew.sh)"

echo "Running casks script..."
sh -c "$(curl -fsSL ${dotfiles}casks.sh)"

echo "Running vim script..."
sh -c "$(curl -fsSL ${dotfiles}vim.sh)"

echo "Running yarn script..."
sh -c "$(curl -fsSL ${dotfiles}yarn.sh)"

echo "Running zsh script..."
sh -c "$(curl -fsSL ${dotfiles}zsh.sh)"


# CREATE SYMLINKS

echo "Creating symlinks..."
ln -sf $DIR/agignore ~/.agignore
ln -sf $DIR/aliases ~/.aliases
ln -sf $DIR/init.vim ~/.config/nvim/init.vim
ln -sf $DIR/inputrc ~/.inputrc
ln -sf $DIR/tmux.conf ~/.tmux.conf
ln -sf $DIR/vimrc ~/.vimrc
ln -sf ~/Dropbox/.gitconfig ~/.gitconfig
ln -sf ~/Dropbox/.ssh/config ~/.ssh/config
ln -sf ~/Dropbox/.zshrc ~/.zshrc

# FINISH

echo "Install finished!"
