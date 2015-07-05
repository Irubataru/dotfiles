#! /bin/sh

OHMYZSHDIST="https://github.com/robbyrussell/oh-my-zsh.git"

echo "Checking for oh-my-zsh..."

if [ ! -d $HOME/.oh-my-zsh ]; then
  echo "oh-my-zsh not found, cloning...";
  git clone $OHMYZSHDIST $HOME/.oh-my-zsh;
  echo "Done cloning oh-my-zsh. Continuing... \n";
else
  echo "oh-my-zsh found! Continuing... \n"
fi
