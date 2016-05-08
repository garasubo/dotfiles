bindkey -v

autoload -U compinit; compinit

setopt auto_cd

setopt extended_glob

setopt hist_ignore_all_dups

setopt hist_ignore_space

autoload -U promptinit; promptinit

prompt redhat

export SUDO_EDITOR='rvi'

alias vi='vim'
alias minicom='LANG=C minicom'

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt EXTENDED_HISTORY


export PATH=~/bin:~/bin/eclipse:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="/home/garasubo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# OPAM configuration
. /home/garasubo/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
