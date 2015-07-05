# History file and settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000

# Configuring oh-my-zsh
ZSH=$HOME/.oh-my-zsh

if [ "$DISPLAY" ]; then
  ZSH_THEME="avit"
  DEFAULT_USER="glesaaen"
else
  autoload -U promptinit
  promptinit
  prompt adam2
fi

#Setting up oh-my-zsh
source $ZSH/oh-my-zsh.sh
plugins=(dircycle git vi-mode)

if [[ -z "$TMUX" ]]; then
  exec tmux
fi
