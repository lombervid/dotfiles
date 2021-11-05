export DOTFILES_DIR

# Defaults configuration name
DEFAULTS_CONFIG="base"

# Base configuration name
BASE_CONFIG="base"

# Configuration files extension
CONFIG_SUFFIX=".yaml"

######### Directories #########
DOTFILES_DIR="dotfiles"
META_DIR="meta"
CONFIG_DIR="config"
MODULES_DIR="${CONFIG_DIR}/modules"
PROFILES_DIR="${CONFIG_DIR}/profiles"
DOTBOT_DIR="${META_DIR}/dotbot"
DOTBOT_BIN="${DOTBOT_DIR}/bin/dotbot"

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# BASE_DIR="$(cd "$(dirname "$(dirname "${BASH_SOURCE[0]}")")" && pwd)"

DEFAULTS_CONFIG="${DEFAULTS_CONFIG}${CONFIG_SUFFIX}"
BASE_CONFIG="${BASE_CONFIG}${CONFIG_SUFFIX}"
CONFIG_DIR="${BASE_DIR}/${CONFIG_DIR}"
META_DIR="${BASE_DIR}/${META_DIR}"
MODULES_DIR="${BASE_DIR}/${MODULES_DIR}"
PROFILES_DIR="${BASE_DIR}/${PROFILES_DIR}"
DOTBOT_DIR="${BASE_DIR}/${DOTBOT_DIR}"
DOTBOT_BIN="${BASE_DIR}/${DOTBOT_BIN}"
