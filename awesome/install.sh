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
  ln -sv $DOTFILES/awesome/rc.lua $AWESOMEDIR/rc.lua
  echo ''
fi

AWESOME35REPO="https://github.com/mikar/awesome-themes.git"

if [ ! -d $AWESOMEDIR/themes ]; then
  echo "Cloning awesome themes"
  git clone $AWESOME35REPO $AWESOMEDIR/themes
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
