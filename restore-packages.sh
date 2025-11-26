#!/bin/bash

backup_dir="$HOME/dotfiles"

echo "Installing pacman packages..."
sudo pacman -S --needed - < "$backup_dir/pkglist-pacman.txt"

echo "Installing AUR packages..."
yay -S --needed - < "$backup_dir/pkglist-aur.txt"
