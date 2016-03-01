#!/bin/bash
#
# This script toggles the extended monitor outputs if something is connected
#

# your notebook monitor
DEFAULT_OUTPUT='LVDS1'

# outputs to toggle if connected
OUTPUTS='VGA1 HDMI1'

# get info from xrandr
XRANDR=`xrandr`

EXECUTE="--output $DEFAULT_OUTPUT --auto "
CURRENT='HDMI1'

if [[ $XRANDR == *$CURRENT\ connected*  ]] # is connected
  then
  if [[ $XRANDR == *$CURRENT\ connected\ \(* ]] # is disabled
    then EXECUTE="--output $CURRENT --auto --output $DEFAULT_OUTPUT --auto --same-as $CURRENT "
    else EXECUTE+="--output $CURRENT --off "
  fi
  else # make sure disconnected outputs are off 
    EXECUTE+="--output $CURRENT --off "
fi

xrandr $EXECUTE
