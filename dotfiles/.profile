[[ -z ${XDG_CONFIG_HOME+x} ]] && export XDG_CONFIG_HOME="${HOME}/.config"

export SHELL_DOT_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/shell"
export SHELL_ALIASES_DIR="${SHELL_DOT_DIR}/aliases"

export PATH="${HOME}/.local/bin:${PATH}"
export EDITOR="nvim"
export VISUAL="${EDITOR}"
export TERMINAL="kitty"
export BROWSER="firefox"

# Composer bin
export PATH="${XDG_CONFIG_HOME}/composer/vendor/bin:${PATH}"

# Rust
export RUSTUP_HOME="${XDG_CONFIG_HOME}/.rustup"
export CARGO_HOME="${XDG_CONFIG_HOME}/.cargo"
export PATH="${CARGO_HOME}/bin:${PATH}"

# Go
export PATH="${PATH}:/usr/local/go/bin"
export GOPATH="${HOME}/.local/share/go"

export NVM_DIR="${XDG_CONFIG_HOME}/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# WSL
if ( grep -qEi "(microsoft|wsl)" /proc/sys/kernel/osrelease &> /dev/null ); then
    export BROWSER="/mnt/c/Program Files/Mozilla Firefox/firefox.exe"
fi
