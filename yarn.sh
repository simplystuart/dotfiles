#!/usr/bin/env bash

packages=(
	clean-css-cli
	elm
	elm-analyse
	elm-doc-preview
	elm-format
	elm-json
	elm-language-server
	elm-oracle
	elm-test
	eslint
	neovim
	ngrok
	npx
	prettier
	uglify-js
)

echo "Installing n..."
npm install -g n

echo "Installing npm packages with yarn..."
for package in "${packages[@]}"; do
	echo "Installing $package..."
	yarn global add "$package"
done

echo "Cleaning up..."
yarn autoclean

echo "Installed ${#packages[@]} packages globally!"
