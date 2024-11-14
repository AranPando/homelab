#!/bin/bash

# Start a passwordless sudo session for this script
echo "Configuring passwordless sudo for this session..."
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USER-setup-shell > /dev/null

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy pre-configured .zshrc to defauly install location
echo "Copying pre-configured .zshrc to default install location"
cp "$SCRIPT_DIR/.zshrc" ~/.zshrc

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install Zsh
echo "Installing Zsh..."
sudo apt install -y zsh

# Set Zsh as the default shell
echo "Setting Zsh as the default shell..."
chsh -s $(which zsh)

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clean up passwordless sudo rule
echo "Cleaning up passwordless sudo configuration..."
sudo rm /etc/sudoers.d/$USER-install-zsh

echo "Installation complete. Please restart your terminal or log out and back in for changes to take effect."
