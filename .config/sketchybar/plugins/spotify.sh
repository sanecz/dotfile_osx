#!/bin/bash


set -x

update ()
{
  TRACK=$(osascript -e 'tell application "Spotify" to name of current track')
  ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track')
  sketchybar -m --set spotify.anchor label="${TRACK}  ${ARTIST}"

}
case "$SENDER" in
  *) update
  ;;
esac

update

