#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"


update() {
  WIDTH="dynamic"
  if [ "$SELECTED" = "true" ]; then
    WIDTH="0"
  fi

  sketchybar --animate tanh 20 --set $NAME icon.highlight=$SELECTED
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    yabai -m space --destroy $SID
    sketchybar --trigger space_change
  else
    yabai -m space --focus $SID 2>/dev/null
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac

sketchybar -m --animate tanh 20 "${args[@]}"
