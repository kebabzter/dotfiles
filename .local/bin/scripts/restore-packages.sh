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

echo "Restoring grub config..."
sudo cp "$dotfiles/etc/default/grub" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Restoring system config files..."
sudo cp "$dotfiles/etc/modprobe.d/nvidia-power.conf" /etc/modprobe.d/nvidia-power.conf

echo "Enabling services..."
sudo systemctl enable \
    bluetooth.service \
    gdm.service \
    lm_sensors.service \
    mongodb.service \
    NetworkManager.service \
    NetworkManager-dispatcher.service \
    NetworkManager-wait-online.service \
    nvidia-hibernate.service \
    nvidia-resume.service \
    nvidia-suspend.service \
    reflector.timer

echo "Linking dotfiles with stow..."
cd "$dotfiles"
stow --adopt .
git checkout .

rm -f "$HOME/etc"

if [ ! -d "$HOME/Documents/holocron" ]; then
    echo "Cloning Obsidian vault..."
    git clone git@github.com:kebabzter/holocron.git "$HOME/Documents/holocron" || echo "Vault clone failed. Add your SSH key to GitHub, then run the clone command again."
fi

echo "Done!"
