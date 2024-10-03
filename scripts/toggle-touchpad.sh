#!/usr/bin/env sh

DEVICE_ID=6  # Cambia esto al ID de tu touchpad obtenido con xinput list

# Obtener el estado actual del touchpad
STATE=$(xinput list-props "$DEVICE_ID" | grep "Device Enabled" | awk '{print $4}')

if [ "$STATE" -eq 1 ]; then
    # Deshabilitar touchpad
    xinput disable "$DEVICE_ID"
    dunstify -i "$(find ~/.config/hypr/pictures/* | sort -R | head -1)" BEHERIT "Touchpad disabled"
else
    # Habilitar touchpad
    xinput enable "$DEVICE_ID"
    dunstify -i "$(find ~/.config/hypr/pictures/* | sort -R | head -1)" BEHERIT "Touchpad enabled"
fi
