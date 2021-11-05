#
# ~/.bashrc
#

echo "Inside ~/.bashrc"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
