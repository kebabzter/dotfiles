# dotfiles

My Arch Linux setup: packages, dotfiles, system config and services.

## Restore on a fresh install

Start from a working Arch install with a user account and internet.

### 1. Clone the repo and run the restore script

```
sudo pacman -S --needed git
git clone https://github.com/kebabzter/dotfiles.git ~/dotfiles
bash ~/dotfiles/.local/bin/scripts/restore.sh
```

The script installs the packages, links the dotfiles with stow, restores the
grub and nvidia config, and enables the services.

### 2. Set up an SSH key

The Obsidian vault is a private repo, so GitHub needs to know who you are.

1. Create a key and print it:
   ```
   ssh-keygen -t ed25519
   cat ~/.ssh/id_ed25519.pub
   ```
2. Copy the whole printed line (it starts with `ssh-ed25519`).
3. On GitHub, go to Settings, then SSH and GPG keys, then New SSH key, and paste it.

### 3. Clone the Obsidian vault

```
git clone git@github.com:kebabzter/holocron.git ~/Documents/holocron
```

(The restore script tries this too, but it fails until the key exists.)

### 4. Reboot

The services and the nvidia setting take effect after a reboot.

## Keeping it up to date

- Run the backup script, then commit and push, to refresh the package lists.
- If you change `/etc/default/grub` or `/etc/modprobe.d/nvidia-power.conf`,
  copy the file back into `~/dotfiles/etc/...` and commit it.
- Commit and push the vault from `~/Documents/holocron` now and then.
