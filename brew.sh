#!/usr/bin/env bash

packages=(
	ag
	awscli
	cocoapods
	coreutils
	curl
	deno
	direnv
	elixir
	exiftool
	ffmpeg
	findutils
	foreman
	git
	glslang
	glslviewer
	grep
	ideviceinstaller
	imagemagick
	ios-deploy
	jpegoptim
	lazygit
	mkcert
	mysql
	ncftp
	neovim
	node
	openconnect
	openssh
	pastel
	pgadmin4
	postgresql
	python2
	python3
	rbenv
	redis
	scc
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
	url="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
	/bin/bash -c "$(curl -fsSL ${url})"
fi

echo "Installing usbmuxd..."
brew install --HEAD usbmuxd
brew link usbmuxd

echo "Installing libimobiledevice..."
brew install --HEAD libimobiledevice

echo "Installing heroku-cli..."
brew tap heroku/brew && brew install heroku

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
