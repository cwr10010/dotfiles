#!/bin/zsh
set -e

WEATHER=/usr/local/bin/weather
LOCATION=$1

typeset -A icon_map
icon_map[day]="〇"
icon_map[blustery]="⚑"
icon_map[rainy]="☂"
icon_map[cloudy]="☁"
icon_map[snowy]="❅"
icon_map[stormy]="☈"
icon_map[foggy]="≡"
icon_map[sunny]="☼"
icon_map[night]="☾"
icon_map[windy]="☴"
icon_map[not_available]="?"
icon_map[unknown]="?"


json_data=$($WEATHER -l $LOCATION -u si --json)
temperature=$(jq ".currently.temperature" <<< "$json_data" | xargs printf '%.0f')
json_icon=$(jq ".currently.icon" <<< "$json_data" | tr -d '"')
icon_array=("${(@s/-/)json_icon}")

for icon in $icon_array; do
  found_icon="${icon_map[$icon]}"
  if [[ -z found_icon ]]; then
    break
  fi
done;

echo "$found_icon $temperature °C"
