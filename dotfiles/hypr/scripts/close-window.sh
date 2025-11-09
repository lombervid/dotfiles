#!/usr/bin/env sh

WINDOW=$(hyprctl activewindow | grep "initialTitle" | tail -1 | awk -F ': ' '{print $2}')
if [ "${WINDOW}" == "" ]; then
    exit;
fi

CHOICE=$(echo -e "Yes\nNo" | rofi -dmenu -no-custom -i -p "Close ${WINDOW}?")
if [ "${CHOICE}" == "Yes" ]; then
    hyprctl dispatch killactive
fi
