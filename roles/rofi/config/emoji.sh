#! /usr/bin/env bash

typename="type-1"
themename="style-5"

dir="$HOME/.config/rofi/launchers"

rofimoji \
  --selector-args="-theme ${dir}/${typename}/${themename}.rasi" \
  --prompt="󰞅 Emojis"
