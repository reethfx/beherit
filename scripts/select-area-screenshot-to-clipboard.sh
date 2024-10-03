#!/usr/bin/env sh

if ! pgrep -x "slurp" >/dev/null; then
	grim -g "$(slurp -b "#000000a5")" - | wl-copy
	dunstify -i "$(find ~/.config/hypr/pictures/* | sort -R | head -1)" BEHERIT "Screenshot saved to clipboard"
fi