#!/bin/bash

backup_dir="$HOME/dotfiles"

echo "Installing required tools..."
sudo pacman -S --needed git base-devel

echo "Installing yay..."
if ! command -v yay >/dev/null 2>&1; then
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ..
  rm -rf yay-bin
else
  echo "yay is already installed."
fi

echo "Installing pacman packages..."
sudo pacman -S --needed - < "$backup_dir/pkglist-pacman.txt"

echo "Installing AUR packages..."
yay -S --needed - < "$backup_dir/pkglist-aur.txt"
