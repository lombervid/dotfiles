[[ -f ~/.profile ]] && . ~/.profile

export DOTFILES_DIR="${${(%):-%x}:A:h:h}"
export ZSH_DOT_DIR="${ZDOTDIR}"
export ZSH_CONFIG_DIR="${ZSH_DOT_DIR}/config"
export ZSH_PLUGINS_DIR="${ZSH_DOT_DIR}/plugins"
export ZSH_THEMES_DIR="${ZSH_DOT_DIR}/themes"
export ZSH_PROMPTS_DIR="${ZSH_DOT_DIR}/prompts"
