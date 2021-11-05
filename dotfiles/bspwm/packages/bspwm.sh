#!/bin/bash

bspwm::resize() {
    local step=20
    local dir
    local falldir
    local x=0
    local y=0

    if bspc query -N -n focused.floating > /dev/null; then
        step=20
    else
        step=100
    fi
    #step=100
 
    case "$1" in
        left) 
            dir=right;
            falldir=left;
            x="-$step";
            y=0
            ;;
        right)
            dir=right;
            falldir=left;
            x="$step";
            y=0
            ;;
        top)
            dir=top;
            falldir=bottom;
            x=0;
            y="-$step"
            ;;
        bottom)
            dir=top;
            falldir=bottom;
            x=0;
            y="$step"
            ;;
    esac
 
    bspc node -z "$dir" "$x" "$y" || bspc node -z "$falldir" "$x" "$y"
}
