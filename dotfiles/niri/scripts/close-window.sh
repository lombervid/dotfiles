#!/usr/bin/env sh

set -euo pipefail
IFS=$'\n\t'

read -r WINDOW_ID WINDOW_TITLE < <(niri msg -j focused-window | jq -r '[.id, .app_id] | @tsv')
if [ "${WINDOW_TITLE}" == "" ]; then
    exit;
fi

CHOICE=$(echo -e "Yes\nNo" | rofi -dmenu -no-custom -i -p "Close ${WINDOW_TITLE}?")
if [ "${CHOICE}" == "Yes" ]; then
    niri msg action close-window --id "${WINDOW_ID}"
fi
