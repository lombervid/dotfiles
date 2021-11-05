#!/usr/bin/env zsh

# Load global functions
[[ -f "${SHELL_DOT_DIR}/functions.sh" ]] && . "${SHELL_DOT_DIR}/functions.sh"

is_plugin() {
  local name=$1
  file_exists "${ZSH_PLUGINS_DIR}/${name}/${name}.plugin.zsh"
}

load_plugin() {
    local name=$1
    if (is_plugin $name); then
        source "${ZSH_PLUGINS_DIR}/${name}/${name}.plugin.zsh"
    else
        echo "[zsh] plugin '$name' not found"
    fi
}

command_not_found_handler() {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=(
        ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"}
    )
    if (( ${#entries[@]} ))
    then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}"
        do
            # (repo package version file)
            local fields=(
                ${(0)entry}
            )
            if [[ "$pkg" != "${fields[2]}" ]]
            then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
}


