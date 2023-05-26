# Defaults configuration name
DEFAULTS_CONFIG="defaults"

# Base configuration name
BASE_CONFIG="base"

# Configuration files extension
CONFIG_SUFFIX=".yaml"

######### Directories #########
META_DIR="meta"
CONFIG_DIR="config"
DOTFILES_DIR="dotfiles"
MODULES_DIR="${CONFIG_DIR}/modules"
PROFILES_DIR="${CONFIG_DIR}/profiles"
DOTBOT_DIR="${META_DIR}/dotbot"
DOTBOT_BIN="${DOTBOT_DIR}/bin/dotbot"

declare -r BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -xr DOTFILES_DIR="${BASE_DIR}/${DOTFILES_DIR}"
declare -r DEFAULTS_CONFIG="${CONFIG_DIR}/${DEFAULTS_CONFIG}${CONFIG_SUFFIX}"
declare -r BASE_CONFIG="${CONFIG_DIR}/${BASE_CONFIG}${CONFIG_SUFFIX}"
declare -r CONFIG_DIR="${BASE_DIR}/${CONFIG_DIR}"
declare -r META_DIR="${BASE_DIR}/${META_DIR}"
declare -r MODULES_DIR="${BASE_DIR}/${MODULES_DIR}"
declare -r PROFILES_DIR="${BASE_DIR}/${PROFILES_DIR}"
declare -r DOTBOT_DIR="${BASE_DIR}/${DOTBOT_DIR}"
declare -r DOTBOT_BIN="${BASE_DIR}/${DOTBOT_BIN}"

# Constants
declare -r TAB='    '
declare -r LF='\n'
declare -r BS='\b'
declare -r TAB2="${TAB}${TAB}"
declare -r LFTAB="${LF}${TAB}"
declare -r LFTAB2="${LF}${TAB2}"

exception() {
    _exit "${2:-1}" "${1:-}"
}

_exit() {
    local msg
    [[ -n "${msg:="${2:-}"}" ]] && echo "${msg}"
    exit "${1:-1}"
}

config_message() {
    echo -e "- shell:\
        ${LFTAB}-\
        ${LFTAB2}description: ''\
        ${LFTAB2}command: echo -e \"\\${LF}Configuring "${1:-}"...\"\
        ${LFTAB2}quiet: true"
}

# Remove temp files
on_exit() {
    [[ -f ${CONFIG_FILE} ]] && rm -f "${CONFIG_FILE}"
    [[ -f ${CONFIG_FILE_SUDO} ]] && rm -f "${CONFIG_FILE_SUDO}"
}

# Execute on_exit function when exit
trap 'on_exit' EXIT
