#!/bin/sh

echo "Installing texmf files"

if [ ! -d $TEXMFHOME ]; then
  echo "Creating the .texmf folder in home directory"
  mkdir -p $TEXMFHOME
fi

BEAMERDIR=$TEXMFHOME/tex/latex/beamer
BEAMERTHEMEDIR=$BEAMERDIR/theme

GITBEAMERREPO="https://github.com/Irubataru/custom-beamer-themes"

if [ ! -d $BEAMERTHEMEDIR ]; then
  echo "Creating the beamer theme folder";
  mkdir -p $BEAMERDIR;
  git clone $GITBEAMERREPO $BEAMERTHEMEDIR
fi

echo "Completed installing texmf files"
