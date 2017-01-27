# Irubataru does dotfiles

## Dotfiles

Inspired by holman's philosophy that dotfiles should be forked, I made a fork of
his github repository, and adopted it to my own environments.

## Installation

For a first time installation, or every time a fresh install is wanted, simply
run the `script/install` bash script, which will

 * Add [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
 * Download some of the zsh-themes I use
 * Download my own [custom beamer
   themes](https://github.com/Irubataru/custom-beamer-themes)

Furthermore, one would want to run `script/bootstrap`, which will symink all
files with the .symlink extension to their designated locations.

## Branches

I will have branches for every computer I use this on which has special
requirements, or a different setup. I try to keep them rebased to the newest
master node, meaning that they can at any time be force-pushed.
