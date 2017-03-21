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

if [ ! -f $HOME/.oh-my-zsh/themes/gitster.zsh-theme ]; then
  echo "gitster theme  missing, pulling...";
  echo ''

  # The gitster theme
  curl -fLo $HOME/.oh-my-zsh/themes/gitster.zsh-theme \
    https://raw.githubusercontent.com/shashankmehta/dotfiles/master/thesetup/zsh/.oh-my-zsh/custom/themes/gitster.zsh-theme

  # The lambda-mod theme
  curl -fLo $HOME/.oh-my-zsh/themes/lambda-mod.zsh-theme \
    https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/master/lambda-mod.zsh-theme

  # The spaceship theme
  curl -fLo $HOME/.oh-my-zsh/themes/spaceship.zsh-theme \
    https://raw.githubusercontent.com/denysdovhan/spaceship-zsh-theme/master/spaceship.zsh

  # The zeta theme
  curl -fLo $HOME/.oh-my-zsh/themes/zeta.zsh-theme \
    https://raw.githubusercontent.com/skylerlee/zeta-zsh-theme/master/zeta.zsh-theme

  # The nt9 theme
  curl -fLo $HOME/.oh-my-zsh/themes/nt9.zsh-theme \
    https://raw.githubusercontent.com/lenguyenthanh/nt9-oh-my-zsh-theme/master/nt9.zsh-theme

  echo "Done fetching the missing theme"
  echo ''
fi
