#!/usr/bin/env bash

casks=(
	adobe-creative-cloud
	amazon-music
	android-studio
	balenaetcher
	basecamp
	brave-browser
	docker
	dropbox
	firefox
	google-backup-and-sync
	google-chrome
	iterm2
	kitematic
	microsoft-edge
	microsoft-office
	oversight
	pocket-casts
	slack
	spotify
	typora
	virtualbox
	virtualbox-extension-pack
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

echo "Installing cask-ugrade..."
brew tap buo/cask-upgrade

echo "Cleaning up..."
brew cleanup

echo "Installed ${#casks[@]} applications!"
