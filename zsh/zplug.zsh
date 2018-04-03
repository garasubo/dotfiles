export ZPLUG_HOME=$HOME/dotfiles/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-history-substring-search"
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zplug "plugins/git",   from:oh-my-zsh, if:"(( $+commands[git] ))"

zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "mrowa44/emojify", as:command

zplug "zsh-users/zsh-completions"

zplug load
