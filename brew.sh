#!/usr/bin/env bash

packages=(
	ag
	coreutils
	curl
	deno
	direnv
	elixir
	exiftool
	ffmpeg
	findutils
	foreman
	gh
	git
	glslang
	glslviewer
	grep
	imagemagick
	jpegoptim
	lazygit
	mkcert
	mysql
	ncftp
	neovim
	node
	nvm
	pastel
	pgadmin4
	postgresql
	rbenv
	redis
	scc
	shpotify
	ssh-copy-id
	tmux
	watch
	wget
	yarn
	youtube-dl
	zsh
	zsh-completions
)

echo "Installing system packages with homebrew..."

echo "Installing homebrew..."
if ! [ -x "$(command -v brew)" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing homebrew on Rosetta..."
if ! [ -x "$(command -v arch -x86_64 brew)" ]; then
	arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing gigalixir-cli..."
brew tap gigalixir/brew && brew install gigalixir

echo "Installing heroku-cli..."
brew tap heroku/brew && brew install heroku
heroku autocomplete --refresh-cache

echo "Installing remaining packages..."
for package in "${packages[@]}"; do
	echo "Installing $package..."
	brew install "$package"
done

echo "Cleaning up..."
brew cleanup

echo "Installed ${#packages[@] + 2} packages!"
