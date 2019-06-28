#!/usr/bin/env bash

packages=(
	clean-css-cli
	elm
	elm-format
	elm-oracle
	elm-test
	npx
	prettier
	uglify-js
)

echo "Installing npm packages with yarn..."
for package in "${packages[@]}"; do
	echo "Installing $package..."
	yarn global add "$package"
done

echo "Cleaning up..."
yarn autoclean

echo "Installed ${#packages[@]} packages globally!"
