dotfiles
========

Collection of my personal dotfiles organised using ansible.

## Installation

Run the appropriate ansible playbook to install (ansible must be installed)

```bash
ansible-playbook --ask-become-pass -i hosts [CONFIG.yml]
```

### Dependencies

Although the config should install most things, the first time setup is often a
bit wonky. One of the reasons is that npm is often not installed on my systems.
It also expects basic build tools, if these are missing from the
[basic](roles/basic) role, then these must either be installed or added.

Node/npm can for instance be installed using nvm, or by downloading the
[npm binaries](https://nodejs.org/en/download) directly and putting them in the
path.

### Addons

The current addons must be installed before using some of the configurations,
see the configurations themselves for which modules they expect.

```
ansible-galaxy install git+https://github.com/c0sco/ansible-modules-bitwarden
ansible-galaxy collection install kewlfft.aur
```

## First time setup

When setting it up for the first time you nee to install the zplug-plugins (if
using) as well as the tmux plugins. Alternatively also logging into atuin.

```
zplug install
<C-A>I
atuin login
```


## Secrets

I currently use bitwarden for secrets, on top of installing the bitwarden
ansible module this means that one also must install the bitwarden CLI. This is
handled by NPM

```
npm install -g @bitwarden/cli
```

