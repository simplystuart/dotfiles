#!/usr/bin/env bash

ohmyzsh="https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

echo "Configuring zsh..."

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL ${ohmyzsh})"

if [ ! -d "$ZSH/custom/themes/spaceship-prompt" ]; then
	echo "Installing spaceship prompt..."
	git clone https://github.com/denysdovhan/spaceship-prompt.git \
		"$ZSH/custom/themes/spaceship-prompt"
	ln -s "$ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" \
		"$ZSH/custom/themes/spaceship.zsh-theme"
fi

if [ ! -d "$ZSH/custom/plugins/zsh-completions" ]; then
	echo "Installing zsh-completions plugin..."
	git clone https://github.com/zsh-users/zsh-completions \
		${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
fi

if [ ! -d "$ZSH/custom/plugins/zsh-iterm-touchbar" ]; then
	echo "Installing zsh-iterm-touchbar plugin..."
	git clone https://github.com/iam4x/zsh-iterm-touchbar.git \
		${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-iterm-touchbar
fi

if [ ! -d "$ZSH/custom/plugins/zsh-nvm" ]; then
	echo "Installing zsh-nvm plugin..."
	git clone https://github.com/lukechilds/zsh-nvm \
		${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-nvm
fi

if [ ! -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]; then
	echo "Installing zsh-syntax-highlighting plugin..."
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
		${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ ! -f ~/.config/base16-shell ]; then
	echo "Installing base16 shell integration..."
	git clone https://github.com/chriskempson/base16-shell.git \
		~/.config/base16-shell
fi

if [ ! -f ~/.iterm2_shell_integration ]; then
	echo "Installing iterm2 shell integration..."
	curl -L https://iterm2.com/shell_integration/zsh \
		-o ~/.iterm2_shell_integration.zsh
fi

echo "Installing Powerline fonts..."
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "Downloading iterm2 colors..."
base16=https://raw.githubusercontent.com/martinlindhe/base16-iterm2/master
curl -o ~/Downloads/base16-materia-256.itermcolors \
	${base16}/itermcolors/base16-materia-256.itermcolors


echo "Updating color scheme..."
bash base16_materia

echo "You are now ready to use zsh!"
