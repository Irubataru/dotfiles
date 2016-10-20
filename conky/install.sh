#!/bin/sh

echo ''
echo "Configuring conky files..."
echo ''

CONKYDIR=$HOME/.config/conky

if [ ! -d $CONKYDIR ]; then
  echo "Creating the conky config directory"
  mkdir -p $CONKYDIR
fi

if [ ! -f $CONKYDIR/conky.conf ]; then
  echo "Linking conky config file"
  ln -s conky.conf $CONKYDIR
  echo ''
fi


echo "Completed installing conky files"
echo ''
