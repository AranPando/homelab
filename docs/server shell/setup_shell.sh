#!/bin/bash

# Exit immediately if any command fails (return a non-zero exit statu)
set -e

# Start a passwordless sudo session for this script
echo "Configuring passwordless sudo for this session..."
echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USER-setup-shell > /dev/null

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install Zsh
echo "Installing Zsh..."
sudo apt install -y zsh

# Set Zsh as the default shell
echo "Setting Zsh as the default shell..."
sudo usermod -s $(which zsh) $USER

# Check if Oh My Zsh is already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed. Skipping installation."
fi

# Install zsh-autosuggestions plugin if not already installed
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions plugin is already installed. Skipping installation."
fi

# Install zsh-syntax-highlighting plugin if not already installed
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting plugin is already installed. Skipping installation."
fi

# Copy pre-configured .zshrc to defauly install location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Copying pre-configured .zshrc to default install location"
cp "$SCRIPT_DIR/.zshrc" ~/.zshrc

# Clean up passwordless sudo rule
echo "Cleaning up passwordless sudo configuration..."
sudo rm /etc/sudoers.d/$USER-setup-shell

echo "Installation complete. Please restart your terminal or log out and back in for changes to take effect."
