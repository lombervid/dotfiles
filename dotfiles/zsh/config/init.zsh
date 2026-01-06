# Load functions
[[ -f "${ZSH_CONFIG_DIR}/functions.zsh" ]] && . "${ZSH_CONFIG_DIR}/functions.zsh"

# Load key bindings
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
