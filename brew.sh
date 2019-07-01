#!/usr/bin/env bash

packages=(
	coreutils
	curl
	elixir
	exiftool
	ffmpeg
	findutils
	git
	glslang
	glslviewer 
	grep
	mysql
	ncftp
	neovim
	node
	openssh
	postgresql
	python3
	shpotify
	ssh-copy-id
	tmux
	vim
	watch
	wine
	wget
	yarn
	youtube-dl
	zsh
	zsh-completions
)

echo "Installing system packages with homebrew..."

echo "Installing homebrew..."
if ! [ -x "$(command -v brew)" ]; then
	url="https://raw.githubusercontent.com/Homebrew/install/master/install"
	ruby -e "$(curl -fsSL ${url})"
fi

echo "Installing packages..."
for package in "${packages[@]}"; do
	echo "Installing $package..."
	brew install "$package"
done

echo "Cleaning up..."
brew cleanup

echo "Installed ${#packages[@] + 2} packages!"
