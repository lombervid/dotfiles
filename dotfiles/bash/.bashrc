#
# ~/.bashrc
#

export DOTFILES_DIR="$(dirname $(dirname $(readlink -f -- "${BASH_SOURCE[0]}")))"

[[ -f ~/.profile ]] && . ~/.profile

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Load global functions
[[ -f "${SHELL_DOT_DIR}/functions.sh" ]] && . "${SHELL_DOT_DIR}/functions.sh"

PS1='[\u@\h \W]\$ '

# Mimic Zsh run-help ability (Alt+h)
run-help() { help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
bind -m vi-insert -x '"\eh": run-help'
bind -m emacs -x     '"\eh": run-help'

# Load aliases
load_aliases

# bash aliases
alias reload="exec bash"
alias config="vim ~/.bashrc"
