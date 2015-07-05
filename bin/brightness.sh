#!/bin/bash

input=${1}

if [ $input -gt 100 ]; then
  percentage=100
else
  percentage=$input
fi

typeset -i max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
new_brightness=$((max_brightness * percentage / 100))

echo $new_brightness | tee /sys/class/backlight/intel_backlight/brightness
