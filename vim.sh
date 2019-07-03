#!/usr/bin/env bash

echo "Configuring vim..."

echo "Installing vim plug..."
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Installing providers..."
pip2 install --user --upgrade pynvim
pip3 install --user --upgrade pynvim

echo "Installing neovim plugins..."
nvim +PlugClean! +qall
nvim +silent +PlugInstall +qall

echo "You are now ready to use vim!"
