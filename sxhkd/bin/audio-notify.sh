AUDIO=$(amixer get Master | tail -n 1 | awk -F ' ' '{print $4}' | tr -d '[]')

dunstctl close
dunstify $AUDIO -t 1500 -i audio-volume-medium-symbolic
