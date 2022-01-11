#!/bin/bash

# COLORS
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
RESET='\033[0m'

# STATES
OK="[${GREEN}OK${RESET}]"
KO="[${RED}KO${RESET}]"
WARN="[${YELLOW}!!${RESET}]"
INFO="[${BLUE}..${RESET}]"

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# PS1 if root/sys-account/user
if [ $EUID -eq 0 ] ; then
	PS1="${RED}\u${RESET}@${GREEN}\h${RESET}:${CYAN}\w${RESET}\$ "
elif [ $EUID -gt 0 ] && [ $EUID -lt 999 ] : then
	PS1="${YELLOW}\u${RESET}@${GREEN}\h${RESET}:${CYAN}\w${RESET}\$ "
else
	PS1="${GREEN}\u${RESET}@${GREEN}\h${RESET}:${CYAN}\w${RESET}\$ "
fi

# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# More aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
