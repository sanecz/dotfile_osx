#!/bin/sh

wifi_dot=(
  icon=􀀁
  icon.color=$TRANSPARENT_ACCENT
  icon.font="$FONT:Black:6.0"
  icon.padding_left=10
  icon.y_offset=0
)

wifi_alias=(
    script="$PLUGIN_DIR/wifi.sh"
    icon.drawing=off                   \
    alias.color="$GREEN"               \
    background.padding_right=-10       \
    icon.padding_right=0               \
    align=right                        \
    popup.align=right                  \
    click_script="$POPUP_CLICK_SCRIPT" \
    script="$PLUGIN_DIR/wifi.sh"       \
    update_freq=1                      \
)

wifi_details=(
    background.corner_radius=12        \
    background.padding_left=15         \
    background.padding_right=15        \
    icon.background.height=2           \
    icon.background.y_offset=-12       \
    label.align=center                 \
    click_script="sketchybar --set wifi.alias popup.drawing=off"
)


sketchybar --add alias  "Control Centre,WiFi" right                      \
           --rename     "Control Centre,WiFi" wifi.alias                 \
           --set        wifi.alias    "${wifi_alias[@]}"                 \
           --subscribe  wifi.alias    mouse.entered                      \
                                      mouse.exited                       \
                                      mouse.exited.global                \
            --add       item          wifi.details popup.wifi.alias      \
            --set       wifi.details  "${wifi_details[@]}"               \
            --add       item          wifi_dot right                     \
            --set       wifi_dot      "${wifi_dot[@]}"
