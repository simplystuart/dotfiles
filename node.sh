#!/usr/bin/env bash

packages=(
	@elm-tooling/elm-language-server
	bash-language-server
	eslint
	neovim
	netlify-cli
	ngrok
	prettier
)

echo "Installing n..."
npm install -g n

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

echo "Installing npm packages..."
for package in "${packages[@]}"; do
	echo "Installing $package..."
	npm install -g "$package"
done

echo "Cleaning up..."
npm cache clean --force

echo "Installed ${#packages[@]} packages globally!"
