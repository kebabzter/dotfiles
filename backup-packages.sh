#!/bin/bash

backup_dir="$HOME/dotfiles"
mkdir -p "$backup_dir"

echo "Saving pacman packages..."
pacman -Qqen > "$backup_dir/pkglist-pacman.txt"

echo "Saving AUR packages..."
pacman -Qqem > "$backup_dir/pkglist-aur.txt"

echo "Done! Files have been backed up in: $backup_dir"
