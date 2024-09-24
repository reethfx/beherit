#!/usr/bin/env sh

if ! pgrep -x "slurp" >/dev/null; then
	grim -g "$(slurp -b "#000000a5")" - | wl-copy
	system-notification "Screenshot saved to clipboard"
fi