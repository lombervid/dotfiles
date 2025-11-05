[[ -f "${ZSH_CONFIG_DIR}/functions.zsh" ]] && . "${ZSH_CONFIG_DIR}/functions.zsh"

include_file "${ZSH_CONFIG_DIR}/key_bindings.zsh"

# Load all plugins defined in .zshrc
for plugin in $plugins; do
    load_plugin "${plugin}"
done

# Load theme
if [[ ! "${ZSH_THEME}" == "" ]]; then
    if [[ -f "${ZSH_THEMES_DIR}/${ZSH_THEME}.zsh-theme" ]]; then
        source "${ZSH_THEMES_DIR}/${ZSH_THEME}.zsh-theme"
    fi
fi

# Load prompt
if [[ ! "${ZSH_PROMPT}" == "" ]]; then
    if [[ -f "${ZSH_PROMPTS_DIR}/${ZSH_PROMPT}.zsh" ]]; then
        source "${ZSH_PROMPTS_DIR}/${ZSH_PROMPT}.zsh"
    fi
fi

# fzf
if (command_exists 'fzf'); then
    source <(fzf --zsh)
fi

# fnm
if (command_exists 'fnm'); then
    eval "$(fnm env --use-on-cd --shell zsh)"
fi

# zoxide
if (command_exists 'zoxide'); then
    eval "$(zoxide init zsh)"
fi

# Homebrew
if (test -x /home/linuxbrew/.linuxbrew/bin/brew); then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

include_file "${ZSH_CONFIG_DIR}/aliases.zsh"
