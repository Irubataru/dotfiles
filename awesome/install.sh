#! /bin/bash

if [ -z $XDG_CONFIG_HOME ]; then
  AWESOMEDIR=$HOME/.config/awesome
else
  AWESOMEDIR=$XDG_CONFIG_HOME/awesome
fi

AWESOMECONFIGFILE=$AWESOMEDIR/rc.lua

echo ''
echo "Configuring awesomeWM ..."
echo ''

if [ ! -e $AWESOMECONFIGFILE ]; then
  echo "Installing the rc.lua confiuration file"
  echo "Select awesome configuration [uni,laptop,skip]";
  select awesomecfg in "uni" "laptop" "skip"; do
    case $awesomecfg in
      uni ) ln -sv $DOTFILES/awesome/rc.lua.uni $AWESOMEDIR/rc.lua; break;;
      laptop ) ln -sv $DOTFILES/awesome/rc.lua.laptop $AWESOMEDIR/rc.lua; break;;
      skip ) ;;
    esac
  done
  echo ''
fi

AWESOME34REPO="https://github.com/mikar/awesome34-themes.git"
AWESOME35REPO="https://github.com/mikar/awesome-themes.git"

if [ ! -d $AWESOMEDIR/themes ]; then
  echo "Cloning awesome themes"
  echo "Select aweome version":
  select awesomevrs in "3.4" "3.5" "skip"; do
    case $awesomevrs in
      3.4 ) git clone $AWESOME34REPO $AWESOMEDIR/themes; break;;
      3.5 ) git clone $AWESOME35REPO $AWESOMEDIR/themes; break;;
      skip ) ;;
    esac
  done
  echo ''
else
  if [ -d $AWESOMEDIR/themes/.git ]; then
    echo "Do you want to update the theme directory?";
    select updaterepo in "Yes" "No"; do
      case $updaterepo in
        Yes ) cd $AWESOMEDIR/themes && git pull; break;;
        No ) break;;
      esac
    done
    echo ''
  fi
fi

echo "Done setting up awesomeWM"
echo ''
