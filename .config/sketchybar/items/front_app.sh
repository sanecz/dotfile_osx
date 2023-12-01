#!/bin/bash

FRONT_APP_SCRIPT='sketchybar --set $NAME label="$INFO"'

front_app=(
  script="$FRONT_APP_SCRIPT"
  label.color=$WHITE
  label.font="$FONT:Bold:13.0"
  label.y_offset=0
  label.padding_left=15
  label.padding_right=10
  padding_right=10
  associated_display=active
#)
#left_bracket=(
  background.color=$PRIMARY_1
  background.corner_radius=6
  background.border_width=2
  background.border_color=$PRIMARY_1
  background.height=28
  background.padding_left=-10
  background.y_offset=2
)

space_bracket=(
  background.color=$TRANSPARENT_ACCENT
  background.corner_radius=6
  background.height=28
  background.y_offset=2
)

sketchybar --add item front_app left           \
           --set front_app "${front_app[@]}"   \
           --subscribe front_app front_app_switched


#sketchybar --add bracket left_bracket apple.logo front_app \
#           --set left_bracket "${left_bracket[@]}"

