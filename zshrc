bindkey -v

autoload -U compinit; compinit

setopt auto_cd

setopt extended_glob

setopt hist_ignore_all_dups

setopt hist_ignore_space

autoload -U promptinit; promptinit
autoload -Uz compinit && compinit

# show git branch name
setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
zstyle ':vcs_info:*' formats '%s][* %F{green}%b%f'
zstyle ':vcs_info:*' actionformats '%s][* %F{green}%b%f(%F{red}%a%f)'

PROMPT='[%*][%F{magenta}%n%f@%F{green}%U%m%u%f:%F{blue}%B%d%f%b]
$ '
RPROMPT='[${vcs_info_msg_0_}]'
SPROMPT='correct: %R -> %r ? '

export SUDO_EDITOR='rvi'

alias vi='vim'
alias minicom='LANG=C minicom'
alias nf='notify-send -u normal  -t 1000 "Finished as $?"'

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=3000
export SAVEHIST=100000
setopt EXTENDED_HISTORY


export PATH=~/bin:~/bin/eclipse:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [[ -s "$HOME/.rbenv" ]]; then
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
    source $HOME/.rbenv/completions/rbenv.zsh
fi

export NVM_DIR="$HOME/.nvm"
load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

        if [ "$nvmrc_node_version" = "N/A" ]; then
            nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
            nvm use
        fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
    fi
}
if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"  # This loads nvm
    autoload -U add-zsh-hook
    add-zsh-hook chpwd load-nvmrc
    load-nvmrc
fi

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# zplug
source $HOME/.zsh/zplug.zsh

# local setting
if [ -e "$HOME/.zshrc.local" ]; then
    source "$HOME/.zshrc.local"
fi


precmd(){ vcs_info }
export PYTHONPATH=$HOME/indeed/shield/products:$PYTHONPATH
export PATH=$PATH:$HOME/indeed/takumi/shark/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
source $HOME/env/etc/indeedrc
