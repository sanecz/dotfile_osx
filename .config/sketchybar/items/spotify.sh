#!/bin/bash

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

spotify_anchor=(
  script="$PLUGIN_DIR/spotify.sh"
  popup.horizontal=on
  popup.align=center
  popup.height=150
  background.color=$PRIMARY_1
  background.corner_radius=6
  background.border_width=2
  background.border_color=$PRIMARY_1
  background.height=32
  label.padding_left=15
  label.padding_right=15
  background.y_offset=2
  label.font="$FONT:Bold:13.0"
  label.drawing=on
  y_offset=2
  updates=on
)

#sketchybar --add event spotify_change $SPOTIFY_EVENT             \
#           --add item spotify.anchor center                      \
#	   --set music "${bracket_defaults[@]}"\
#           --set spotify.anchor "${spotify_anchor[@]}"            \
#	   --subscribe spotify.anchor spotify_change

MUSIC_EVENT="com.spotify.client.PlaybackStateChanged"
sketchybar  --add event music_change $MUSIC_EVENT \
	    --add item spotify.anchor center                       \
	    --set spotify.anchor "${spotify_anchor[@]}" \
\
	    --add item music right \
	    --set music "${bracket_defaults[@]}" \
		script="$PLUGIN_DIR/spotify.sh" \
		label.padding_right=8 \
		background.padding_right=$PADDINGS \
		updates=on \
\
	    --subscribe music music_change

