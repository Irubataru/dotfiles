#!/bin/env bash

astal-notifd --daemonize &
sleep 1 # just to be safe
hyprpanel
