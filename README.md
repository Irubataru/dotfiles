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
