# History file and settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000

export DISABLE_LS_COLORS="true"

# Configuring oh-my-zsh
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="lambda-mod"
DEFAULT_USER="glesaaen"

#Setting up oh-my-zsh
source $ZSH/oh-my-zsh.sh
plugins=(dircycle git vi-mode)
