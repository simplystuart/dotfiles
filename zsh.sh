#!/usr/bin/env bash

oh_my_zsh="https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

echo "Configuring zsh..."

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL ${oh_my_zsh})"

echo "Updating shell..."
if ! grep -Fxq $(which zsh) /etc/shells
then
	echo $(which zsh) | sudo tee -a /etc/shells
fi
chsh -s $(which zsh)

if [ ! -d "$ZSH/custom/themes/spaceship-prompt" ]; then
	echo "Installing spaceship prompt..."
	git clone https://github.com/denysdovhan/spaceship-prompt.git \
		"$ZSH/custom/themes/spaceship-prompt"
	ln -s "$ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" \
		"$ZSH/custom/themes/spaceship.zsh-theme"
fi

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

echo "Installing Powerline fonts..."
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "You are now ready to use zsh!"
