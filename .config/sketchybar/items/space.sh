#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15")

sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  if [ $sid -eq 10 ]; then
     padding_right=6
   else
     padding_right=0
  fi


  space=(
    associated_space=$sid
    icon=${SPACE_ICONS[i]}
    icon.y_offset=0
    icon.padding_left=10    
    icon.padding_right=10
    icon.font="$FONT:Bold:13.0"
    icon.highlight_color=$ACCENT_COLOR
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done


space_dot=(
  icon=􀀁
  icon.color=$TRANSPARENT_ACCENT
  icon.font="$FONT:Black:6.0"
  icon.padding_left=10
  icon.padding_right=10
  icon.y_offset=0
)


separator=(
  icon=􀆊
  icon.font="$FONT:Bold:10.0"
  label.drawing=off
  icon.padding_left=10    
  icon.padding_right=10
  icon.y_offset=0
  associated_display=active
  click_script='yabai -m space --create && sketchybar --trigger space_change'
  icon.color=$WHITE
)

space_bracket=(
  background.color=$TRANSPARENT_ACCENT
  background.corner_radius=6
  background.height=28
  background.y_offset=2
)

left_bracket=(
  background.color=$PRIMARY_1
  background.corner_radius=6
  background.border_width=2
  background.border_color=$PRIMARY_1
  background.height=28
  background.y_offset=2
)

sketchybar --add item space_dot left \
           --set space_dot "${space_dot[@]}"

sketchybar --add item separator left          \
           --set separator "${separator[@]}"

#sketchybar --add bracket spaces '/space\..*/'  \
#           --set spaces "${space_bracket[@]}"

sketchybar --add bracket space_bracket \
           --set space_bracket "${space_bracket[@]}"
	  

sketchybar --add bracket left_bracket apple.logo  space_dot separator\
           --set left_bracket "${left_bracket[@]}"
