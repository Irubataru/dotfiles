# History file and settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000

export DISABLE_LS_COLORS="true"

# Configuring oh-my-zsh
ZSH=$HOME/.oh-my-zsh

if [ "$DISPLAY" ]; then
  ZSH_THEME="gitster"
  DEFAULT_USER="glesaaen"
else
  autoload -U promptinit
  promptinit
  prompt adam2
fi

#Setting up oh-my-zsh
source $ZSH/oh-my-zsh.sh
plugins=(dircycle git vi-mode)

if hash tmux 2> /dev/null; then
  if [[ -z "$TMUX" ]]; then
    exec tmux
  fi
fi
