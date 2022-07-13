# Arch linux first boot

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

## Transferring ssh public key

In order to clone the dotfiles it's best to first register the SSH key with
github so I can clone it with easy write access. There are two ways of doing
that.

### Using GitHub Cli

```bash
# Install GitHub cli
sudo pacman -S github-cli

# Add the SSH key
gh ss-key add [key file] -t [key title] 
```

### Using a second computer

Using e.g. magic wormhole it's easy to send the public key file to a second
computer that has GitHub access

```bash
# Install magic-wormhole
pip install --user magic-wormhole

# Send the SSH key
wormhole send [key file]

# Recieve the key on the other end
wormhole receive
```
