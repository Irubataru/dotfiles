#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)

type="type-3"
theme='style-10'

dir="$HOME/.config/rofi/launchers"
## Run
rofi \
  -show drun \
  -theme ${dir}/${type}/${theme}.rasi
