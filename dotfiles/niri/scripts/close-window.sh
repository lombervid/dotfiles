#!/usr/bin/env sh

WINDOW=$(niri msg focused-window | grep "App ID:" | awk -F ': ' '{print $2}')
if [ "${WINDOW}" == "" ]; then
    exit;
fi

CHOICE=$(echo -e "Yes\nNo" | rofi -dmenu -no-custom -i -p "Close ${WINDOW}?")
if [ "${CHOICE}" == "Yes" ]; then
    niri msg action close-window
fi
