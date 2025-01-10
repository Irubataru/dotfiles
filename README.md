# dotfiles

Collection of my personal dotfiles organised using ansible.

## Installation

Run the appropriate ansible playbook to install (ansible must be installed)

```bash
ansible-playbook --ask-become-pass -i hosts [CONFIG.yml]
```

The playbooks do not by default install any applications, to do so you need to
pass the `install = true` variable. This should be passed to the command, but
can also be set in the [group_vars](./group_vars/)

```bash
ansible-playbook --ask-become-pass -i hosts --extra-vars "install=true" [CONFIG.yml]
```

### Dependencies

Although the config should install most things, the first time setup is often a
bit wonky. One of the reasons is that npm is often not installed on my systems.
It also expects basic build tools, if these are missing from the
[basic](roles/basic) role, then these must either be installed or added.

### Addons

The current addons must be installed before using some of the configurations,
see the configurations themselves for which modules they expect.

```text
ansible-galaxy collection install kewlfft.aur
```

## First time setup

### atuin

If using atuin, you need to login the firs time

```
atuin login
```

## Secrets

Secrets have to be manually added. See e.g. the [git](./roles/git/) for adding a
git application key.
