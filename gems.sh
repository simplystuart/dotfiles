
#!/usr/bin/env bash

export GEM_HOME="$HOME/.gem"

gems=(
	solargraph
)

echo "Installing ruby packages with gem..."

echo "Installing gems..."
for gem in "${gems[@]}"; do
	echo "Installing $gem..."
	gem install --silent "$gem"
done

echo "Installed ${#gems[@] + 2} gems!"
