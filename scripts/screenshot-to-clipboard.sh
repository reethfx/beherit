#!/usr/bin/env sh

grim - | wl-copy
dunstify -i "$(find ~/.config/hypr/pictures/* | sort -R | head -1)" BEHERIT "Screenshot saved to clipboard"