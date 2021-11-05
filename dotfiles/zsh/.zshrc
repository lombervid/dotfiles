# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_PROMPT='pure'

plugins=(
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

# Lines configured by zsh-newuser-install
HISTFILE="${ZSH_DOT_DIR}/.zhistory"
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "${ZSH_DOT_DIR}/.zshrc"

# Activate menu completion (press Tab twice)
zstyle ':completion:*' menu select

## case-insensitive (all) completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
## case-insensitive,partial-word and then substring completion
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Autocompletion of command line switches for aliases
setopt COMPLETE_ALIASES

zle_highlight=(paste:underline,fg=green isearch:underline,fg=cyan)

#autoload -Uz compinit promptinit
#compinit
#promptinit

# Activate menu completion (press Tab twice)
#zstyle ':completion:*' menu select
# Autocompletion of command line switches for aliases
#setopt COMPLETE_ALIASES

# End of lines added by compinstall
#
# Prompt
# autoload -Uz promptinit
# promptinit

# prompt walters

# Load key bingings
if [[ -f "${ZSH_CONFIG_DIR}/init.zsh" ]]; then
    . "${ZSH_CONFIG_DIR}/init.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

