#!/bin/bash

right_bracket=(
  background.color=$PRIMARY_1
  background.corner_radius=6
  background.border_width=2
  background.border_color=$PRIMARY_1
  background.height=28
  background.y_offset=2
)

STATS=("Stats,CPU_mini"  "Stats,Sensors_sensors")

space=(
    background.padding_right=0
    background.padding_left=0
)


sketchybar --add alias "Stats,CPU_mini" right   \
           --set "Stats,CPU_mini" "${space[@]}"
sketchybar --add alias "Stats,Sensors_sensors" right   \
           --set "Stats,Sensors_sensors" "${space[@]}"

sketchybar --add bracket right_bracket volume battery time power "${STATS[@]}" \
           --set right_bracket "${right_bracket[@]}"
