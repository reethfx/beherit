#!/usr/bin/env sh

window_title=$(hyprctl clients -j | jq -r '.[] | select(.title != "") | "\(.title)"' | tofi --prompt-text="󱂬 Window: ")
window_workspace_id=$(hyprctl clients -j | jq --arg window_title "$window_title" '.[] | select(.title == $window_title) | .workspace.id' | head -n 1)

if [ ! "$window_title" = "" ]; then
	hyprctl dispatch workspace "$window_workspace_id"
fi