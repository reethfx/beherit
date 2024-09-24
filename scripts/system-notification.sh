#!/usr/bin/env sh

dunstify -i "$(find ~/.config/hypr/pictures/* | sort -R | head -1)" BEHERIT "$1"
