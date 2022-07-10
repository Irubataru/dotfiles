dotfiles
========

Collection of my personal dotfiles organised using ansible.

## Installation

Run the appropriate ansible playbook to install, for example to install the
on my Arch Linux laptop

```bash
ansible-playbook --ask-become-pass -i hosts [CONFIG.yml]
```

## Addons

The current addons must be installed before using some of the configurations,
see the configurations themselves for which modules they expect.

```
ansible-galaxy install git+https://github.com/c0sco/ansible-modules-bitwarden
ansible-galaxy collection install kewlfft.aur
```

## Secrets

I currently use bitwarden for secrets, on top of installing the bitwarden
ansible module this means that one also must install the bitwarden CLI. This is
handled by NPM

```
npm install -g @bitwarden/cli
```
