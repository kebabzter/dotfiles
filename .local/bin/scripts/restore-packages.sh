#!/bin/bash
set -e

dotfiles="$HOME/dotfiles"
scripts="$dotfiles/.local/bin/scripts"

echo "Installing git, base-devel and stow..."
sudo pacman -S --needed --noconfirm git base-devel stow

if [ ! -d "$dotfiles" ]; then
    echo "Cloning dotfiles..."
    git clone https://github.com/kebabzter/dotfiles.git "$dotfiles"
fi

if ! command -v yay > /dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd "$HOME"
fi

echo "Installing pacman packages..."
sudo pacman -S --needed - < "$scripts/pkglist-pacman.txt"

echo "Installing AUR packages..."
yay -S --needed - < "$scripts/pkglist-aur.txt"

echo "Linking dotfiles with stow..."
cd "$dotfiles"
stow .

echo "Done!"
