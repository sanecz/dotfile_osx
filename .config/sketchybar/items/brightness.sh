#!/bin/bash

brightness_slider=(
  script="$PLUGIN_DIR/brightness.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$BLUE
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color=$TRANSPARENT_ACCENT
  slider.knob=""
  slider.knob.drawing=off
)

brightness_icon=(
  click_script="$PLUGIN_DIR/brightness_click.sh"
  padding_left=12
  icon=
  icon.width=0
  icon.align=left
  icon.color=$WHITE
  icon.font="$FONT:Regular:13.0"
  icon.y_offset=0
  label.width=25
  label.align=left
  label.font="$FONT:Regular:13.0"
)

sketchybar --add slider brightness right                \
           --set brightness "${brightness_slider[@]}"   \
           --subscribe brightness brightness_change     \
                                  mouse.clicked         \
                                  mouse.entered         \
                                  mouse.exited          \
           --add item brightness_icon right             \
           --set brightness_icon "${brightness_icon[@]}"

