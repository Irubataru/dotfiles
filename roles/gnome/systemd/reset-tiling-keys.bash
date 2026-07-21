#!/usr/bin/env bash

gsettings set org.gnome.shell.extensions.tiling-assistant tile-left-half "[]"
gsettings set org.gnome.shell.extensions.tiling-assistant tile-right-half "[]"

gsettings set org.gnome.mutter.keybindings toggle-tiled-right "[]"
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "[]"
