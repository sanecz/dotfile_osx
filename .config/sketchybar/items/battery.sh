#!/bin/bash

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$FONT:Regular:16.0"
  icon.padding_left=8
  icon.y_offset=0
  label.padding_left=4
  label.drawing=off
  label.font="$FONT:Bold:13.0"
  label.color=$ACCENT_COLOR
  label.y_offset=0
  update_freq=120
  updates=on
)

sketchybar --add event battery_update \
           --add item battery right \
           --set battery "${battery[@]}" \
           --subscribe battery battery_update power_source_change system_woke
