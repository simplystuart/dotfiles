#!/usr/bin/env bash

casks=(
	adobe-creative-cloud
	balenaetcher
	basecamp
	docker
	dropbox
	firefox
	google-backup-and-sync
	google-chrome
	iterm2
	microsoft-edge
	pocket-casts
	slack
	spotify
	typora
	virtualbox
	virtualbox-extension-pack
	vlc
	zoom
)

echo "Installing gui applications with homebrew casks..."

echo "Updating brew..."
brew update

echo "Installing casks..."
for cask in "${casks[@]}"; do
	echo "Installing $cask..."
	brew install --cask "$cask"
done

echo "Installing cask-ugrade..."
brew tap buo/cask-upgrade

echo "Cleaning up..."
brew cleanup

echo "Installed ${#casks[@]} applications!"
