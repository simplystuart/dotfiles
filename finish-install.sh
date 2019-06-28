#!/usr/bin/env bash

oh_my_zsh=https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh

echo "Finishing system install..."

# configure shell

#TODO: is this working properly?
echo "Updating shell..."
if ! grep -Fxq $(which zsh) /etc/shells
then
	echo $(which zsh) | sudo tee -a /etc/shells
fi
chsh -s $(which zsh)

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL ${oh_my_zsh})"

if [ ! -d "$ZSH/custom/themes/spaceship-prompt" ]; then
	echo "Installing spaceship prompt..."
	git clone https://github.com/denysdovhan/spaceship-prompt.git \
		"$ZSH/custom/themes/spaceship-prompt"
	ln -s "$ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" \
		"$ZSH/custom/themes/spaceship.zsh-theme"
fi

# create config dirs

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

# install shell integrations

echo "Installing base16 shell integration..."
if [ ! -f ~/.config/base16-shell ]; then
	git clone https://github.com/chriskempson/base16-shell.git \
    	~/.config/base16-shell
fi

echo "Installing iterm2 shell integration..."
if [ ! -f ~/.iterm2_shell_integration ]; then
	curl -L https://iterm2.com/shell_integration/zsh \
		-o ~/.iterm2_shell_integration.zsh
fi

# configure vim

echo "Installing vim plug..."
if [ ! -f ~/.vim/autoload/plug.vim ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Installing neovim plugins..."
nvim +PlugClean! +qall
nvim +silent +PlugInstall +qall

# create symlinks

echo "Symlinking dotfiles..."
ln -sf $DIR/agignore ~/.agignore
ln -sf $DIR/aliases ~/.aliases
ln -sf $DIR/init.vim ~/.config/nvim/init.vim
ln -sf $DIR/inputrc ~/.inputrc
ln -sf $DIR/tmux.conf ~/.tmux.conf
ln -sf $DIR/vimrc ~/.vimrc
ln -sf ~/Dropbox/.gitconfig ~/.gitconfig
ln -sf ~/Dropbox/.ssh/config ~/.ssh/config
ln -sf ~/Dropbox/.zshrc ~/.zshrc


echo "Install finished!"
