#!/usr/bin/env bash

packages=(
	ag
	cocoapods
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
	ideviceinstaller
	imagemagick
	ios-deploy
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
	wget
	wine
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

echo "Installing usbmuxd..."
brew install --HEAD usbmuxd
brew link usbmuxd

echo "Installing libimobiledevice..."
brew install --HEAD libimobiledevice

echo "Installing remaining packages..."
for package in "${packages[@]}"; do
	echo "Installing $package..."
	brew install "$package"
done

echo "Setting up pods from brew install..."
pod setup

echo "Cleaning up..."
brew cleanup

echo "Installed ${#packages[@] + 2} packages!"
