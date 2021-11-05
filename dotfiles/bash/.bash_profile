#
# ~/.bash_profile
#
export DOTFILES_DIR="$(dirname $(dirname $(readlink -f -- "${BASH_SOURCE[0]}")))"

[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc
