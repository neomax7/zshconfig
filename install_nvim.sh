#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# 1. Download the latest release
echo "Downloading Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# 2. Untar the downloaded file
echo "Extracting..."
tar xzf nvim-linux-x86_64.tar.gz

# 3. Go into the untarred directory
cd nvim-linux-x86_64

# 4-9. Move files to system directories and clean up old versions
echo "Installing to system directories (you may be prompted for your password)..."

sudo mv ./bin/nvim /bin/nvim
sudo rm -rf /usr/lib/nvim
sudo mv ./lib/nvim /usr/lib/
sudo rm -rf /usr/share/nvim
sudo mv ./share/nvim /usr/share/
sudo mv ./share/man/man1/nvim.1 /usr/share/man/man1/

rm -rf nvim-linux-x86_64*

mkdir -p ~/.config/nvim
cp ./config/nvim/lazyvim.json ~/.config/nvim/lazyvim.json

echo "Installation complete!"
