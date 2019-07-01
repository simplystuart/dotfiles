#!/usr/bin/env bash

dotfiles=/Users/stuartdum/Projects/dotfiles
home=/Users/stuartdum
url="https://raw.githubusercontent.com/simplystuart/dotfiles/master/"

# CREATE DIRECTORIES

if [ ! -d $home/.config ]; then
	echo "Creating empty .config dir..."
	mkdir -p $home/.config
fi

if [ ! -d $home/.config/nvim ]; then
	echo "Creating empty .config/nvim dir..."
	mkdir -p $home/.config/nvim
fi

if [ ! -d $home/.ssh ]; then
	echo "Creating empty .ssh dir..."
	mkdir $home/.ssh
fi

if [ ! -d $home/.vim/tmp ]; then
	echo "Creating empty .vim/tmp dir..."
	mkdir -p $home/.vim/tmp
fi

if [ ! -d $home/Projects ]; then
	echo "Creating empty Projects dir..."
	mkdir $home/Projects
fi

# CLONE DOTFILES PROJECT

echo "Cloning dotfiles project..."
cd ~/Projects
git clone https://github.com/simplystuart/dotfiles.git
cd ..

# RUN SCRIPTS

echo "Running brew script..."
sh -c "$(curl -fsSL ${url}brew.sh)"

echo "Running casks script..."
sh -c "$(curl -fsSL ${url}casks.sh)"

echo "Running vim script..."
sh -c "$(curl -fsSL ${url}vim.sh)"

echo "Running yarn script..."
sh -c "$(curl -fsSL ${url}yarn.sh)"

echo "Running zsh script..."
sh -c "$(curl -fsSL ${url}zsh.sh)"


# CREATE SYMLINKS

echo "Creating symlinks..."
ln -sf $dotfiles/agignore $home/.agignore
ln -sf $dotfiles/aliases $home/.aliases
ln -sf $dotfiles/init.vim $home/.config/nvim/init.vim
ln -sf $dotfiles/inputrc $home/.inputrc
ln -sf $dotfiles/tmux.conf $home/.tmux.conf
ln -sf $dotfiles/vimrc $home/.vimrc
ln -sf $home/Dropbox/.gitconfig $home/.gitconfig
ln -sf $home/Dropbox/.ssh/config $home/.ssh/config
ln -sf $home/Dropbox/.zshrc $home/.zshrc

# FINISH

echo "Install finished!"
