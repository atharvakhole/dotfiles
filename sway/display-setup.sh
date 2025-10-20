#!/bin/bash

# Check if HDMI-A-1 is active using jq for reliable JSON parsing
if swaymsg -t get_outputs -r | jq -e '.[] | select(.name == "HDMI-A-1" and .active)' >/dev/null; then
  swaymsg output eDP-1 mode 1920x1080@60Hz position 0,0
  swaymsg output HDMI-A-1 mode 1920x1080@165Hz position 1920,0
  notify-send "Display Setup" "External monitor detected. Dual display layout applied."
else
  swaymsg output eDP-1 mode 1920x1080@60Hz position 0,0
  swaymsg output HDMI-A-1 disable
  notify-send "Display Setup" "External monitor not found. Using laptop display only."
fi
