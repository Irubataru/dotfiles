alias reload!='. ~/.zshrc'

# Useful ls aliases
alias ls='ls --group-directories-first --color=auto --hide="*~"'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'

# Useful cd aliases
alias cr='cd "$(git rev-parse --show-toplevel)"'

# Verbose file operations
alias rm='rm -v'
alias mv='mv -v'
alias cp='cp -v'
