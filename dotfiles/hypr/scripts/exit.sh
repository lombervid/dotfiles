#!/usr/bin/env sh

CHOICE=$(echo -e "Yes\nNo" | rofi -dmenu -no-custom -i -p "Exit hyprland")
if [ "${CHOICE}" == "Yes" ]; then
    loginctl terminate-user ""
fi
