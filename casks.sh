#!/usr/bin/env bash

casks=(
	adobe-creative-cloud
	android-studio
	basecamp
	docker
	dropbox
	firefox
	google-backup-and-sync
	google-chrome
	iterm2
	kitematic
	microsoft-office
	oversight
	pocket-casts
	slack
	spotify
	typora
	virtualbox
	vlc
	zoomus
)

echo "Installing gui applications with homebrew casks..."

echo "Updating brew..."
brew update

echo "Installing casks..."
for cask in "${casks[@]}"; do
	echo "Installing $cask..."
	brew cask install "$cask"
done

echo "Cleaning up..."
brew cleanup

echo "Installed ${#casks[@]} applications!"
