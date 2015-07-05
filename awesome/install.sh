#! /bin/bash

if [ -z $XDG_CONFIG_HOME ]; then
  AWESOMEDIR=$HOME/.config/awesome
else
  AWESOMEDIR=$XDG_CONFIG_HOME/awesome
fi

AWESOMECONFIGFILE=$AWESOMEDIR/rc.lua

if [ ! -e $AWESOMECONFIGFILE ]; then
  echo "Installing awesome configuration"
  echo "Select awesome configuration [laptop,uni]"
  select awesomecfg in "uni" "laptop"; do
    case $awesomecfg in
      uni ) ln -sv $DOTFILES/awesome/rc.lua.uni $AWESOMEDIR/rc.lua; break;;
      laptop ) ln -sv $DOTFILES/awesome/rc.lua.laptop $AWESOMEDIR/rc.lua; break;;
    esac
  done
fi

AWESOME34REPO="https://github.com/mikar/awesome34-themes.git"
AWESOME35REPO="https://github.com/mikar/awesome-themes.git"

if [ ! -d $AWESOMEDIR/themes ]; then
  echo "Cloning awesome themes"
  echo "Select aweome version":
  select awesomevrs in "3.4" "3.5"; do
    case $awesomevrs in
      3.4 ) git clone $AWESOME34REPO $AWESOMEDIR/themes; break;;
      3.5 ) git clone $AWESOME35REPO $AWESOMEDIR/themes; break;;
    esac
  done
else
  if [ -d $AWESOMEDIR/themes/.git ]; then
    echo "Do you want to update the theme directory?"
    select updaterepo in "Yes" "No"; do
      case $updaterepo in
        Yes ) cd $AWESOMEDIR/themes && git pull; break;;
        No ) break;;
      esac
    done
  fi
fi

echo "Done setting up awesomeWM"
