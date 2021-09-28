dotfiles
========

Collection of my personal dotfiles organised using ansible.

## Installation

Run the appropriate ansible playbook to install, for example to install the
on my Arch Linux laptop

```bash
ansible-playbook --ask-become-pass -i hosts arch-laptop.yml
```

## Configurations

There are currently 3 configurations

 * __arch-laptop__: Archlinux installation I have on my laptop
 * __ubuntu-vbox__: The virtualbox installation I have for ubuntu
 * __windows-wsl__: Ubuntu installation I have using WSL in Windows

## Addons

The current addons must be installed before using some of the configurations,
see the configurations themselves for which modules they expect.

```
ansible-galaxy install git+https://github.com/c0sco/ansible-modules-bitwarden
```

## Secrets

I currently use bitwarden for secrets, on top of installing the bitwarden
ansible module this means that one also must install the bitwarden CLI. This is
handled by NPM

```
npm install -g @bitwarden/cli
```
