Arch linux first boot
=====================

After running the arch installer there are a couple of things that must be done
before ansible can be run. These are the following

```bash
# Starting awesome
echo "exec awesome" > $HOME/.xinitrc
startx

# Setup multiple monitors
autorandr horizontal

# Generating an ssh key
ssh-keygen -t rsa -b 4096

# Setup rust
rustup default stable

# Install paru
git clone https://aur.archlinux.org/paru.git
makepkg -s
pacman -U ...

# Install paru packages, specially ones where there are conflicts that need to
# be resolved
paru -S dtrx
paru -S awesome-git
paru -S alacritty-git
paru -S xidlehook-git handlr-bin xdg-utils-handlr

# Download node and install
"https://nodejs.org/en/download/current/"
# Copy contents to ~/.local
export PATH="/home/glesaaen/.local:$PATH"
```
