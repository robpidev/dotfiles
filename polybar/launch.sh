#/bin/bash

killall -q polybar

# Launch Polybar,
polybar --config=$HOME/.config/polybar/config.ini drak | tee -a /tmp/polybar.log & disown

echo "polybar Launched.."
