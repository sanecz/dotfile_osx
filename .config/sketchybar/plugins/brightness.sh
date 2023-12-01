#!/bin/bash

WIDTH=100

brightness_change() {

  sketchybar --set $NAME slider.percentage=$INFO \
             --animate tanh 30 --set $NAME slider.width=$WIDTH 


  FINAL_PERCENTAGE=$(sketchybar --query $NAME | jq -r ".slider.percentage")
  if [[ "$FINAL_PERCENTAGE" -eq "$INFO" ]]; then
    sketchybar --animate tanh 30 --set $NAME slider.width=0
  fi
}

mouse_clicked() {
  brightness $(bc -l <<< $PERCENTAGE/100)
}

mouse_entered() {
  sketchybar --set $NAME slider.knob.drawing=on
}

mouse_exited() {
  sketchybar --set $NAME slider.knob.drawing=off
}

case "$SENDER" in
  "brightness_change") brightness_change
  ;;
  "mouse.clicked") mouse_clicked
  ;;
  "mouse.entered") mouse_entered
  ;;
  "mouse.exited") mouse_exited
  ;;
esac
