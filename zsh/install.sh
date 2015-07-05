#! /bin/sh

OHMYZSHDIST="https://github.com/robbyrussell/oh-my-zsh.git"

echo ''
echo "Checking for oh-my-zsh..."
echo ''

if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "oh-my-zsh not found, cloning...";
  echo''
  git clone $OHMYZSHDIST $HOME/.oh-my-zsh;
  echo''
  echo "Done cloning oh-my-zsh. Continuing..."
  echo ''
else
  echo "oh-my-zsh found! Continuing..."
  echo ''
fi
