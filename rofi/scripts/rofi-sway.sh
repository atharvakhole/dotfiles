#!/bin/sh

# Get total number of monitors
TOTAL_MONITORS=$(swaymsg -t get_outputs | jq -r 'length')

# Get focused monitor index from sway
SWAY_MONITOR=$(swaymsg -t get_outputs | jq -r 'to_entries | .[] | select(.value.focused) | .key')

# Invert the index (if you have 2 monitors: 0->1, 1->0)
MONITOR_ID=$((TOTAL_MONITORS - SWAY_MONITOR - 1))

echo "Sway monitor: $SWAY_MONITOR, Rofi monitor: $MONITOR_ID" >&2

rofi -m $MONITOR_ID "$@"
