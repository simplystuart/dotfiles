echo "Configuring Mac settings..."

echo "Limit dark mode to only be the dock, spotlight, and taskbar..."
defaults write -g NSRequiresAquaSystemAppearance -bool Yes
defaults write com.apple.Spotlight NSRequiresAquaSystemAppearance -bool No

echo "Mac settings are good to go!"
