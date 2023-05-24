# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

ZSH=$HOME/dotfiles

#---Set Alias---

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

alias c='clear'
alias h='history | less'
alias r='source ~/dotfiles/.zshrc' 
alias ez='v ~/dotfiles/.zshrc'
alias er=ez
alias dot='cd ~/dotfiles'

alias ls='ls --color=auto'
alias lsg='ls --group-directories-first'
alias ll='ls -alF'
alias la='ls -a'
alias l='ls -CF'
alias lt='ll -ltrG'

alias grep='grep --color=auto'

# alias rm='rm -i'
# alias mv='mv -i'
# alias cp='cp -i'

alias ..='cd ..'

# Change working dir in shell to last dir in lf on exit (adapted from ranger).
#
# You need to either copy the content of this file to your shell rc file
# (e.g. ~/.bashrc) or source this file directly:
#
#     LFCD="/path/to/lfcd.sh"
#     if [ -f "$LFCD" ]; then
#         source "$LFCD"
#     fi
#
# You may also like to assign a key (Ctrl-O) to this command:
#
#     bind '"\C-o":"lfcd\C-m"'  # bash
#     bindkey -s '^o' 'lfcd\n'  # zsh
#

lfcd () {
    tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

bindkey -s '^o' 'lfcd\n'  # zsh

#Powerlevel10k
source $ZSH/themes/powerlevel10k/powerlevel10k.zsh-theme

#Auto-suggestions
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#Auto-completions
fpath=($ZSH/plugins/zsh-completions/src $fpath)

#Syntax-highlighting, always in the end of .zshrc
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#History-substring-search
source $ZSH/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up #Bind up arrow key
bindkey '^[[B' history-substring-search-down #Bind down arrow key

