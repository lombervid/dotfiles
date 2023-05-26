include_file() {
    if (file_exists "${1}"); then
        . "${1}"
    else
        echo "There was an error trying to load "${1}""
    fi
}

file_exists() {
    builtin test -f "${1}"
}

command_exists() {
    command -v "${1}" > /dev/null 2>&1
}

load_aliases() {
    for file in ${SHELL_ALIASES_DIR}/*.sh; do
        . "${file}"
    done
}


# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}
