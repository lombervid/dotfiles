[[ -z ${XDG_CONFIG_HOME+x} ]] && export XDG_CONFIG_HOME="${HOME}/.config"

export SHELL_DOT_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/shell"
export SHELL_ALIASES_DIR="${SHELL_DOT_DIR}/aliases"

export PATH="${HOME}/.local/bin:${PATH}"
export EDITOR="nvim"
export VISUAL="${EDITOR}"
export TERMINAL="kitty"
export BROWSER="firefox"

# Composer bin
export PATH="${HOME}/.config/composer/vendor/bin:${PATH}"

# Go
export PATH="${PATH}:/usr/local/go/bin"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
