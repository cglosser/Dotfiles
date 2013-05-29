#!/bin/bash
# Automatically create symbolic links to version-controlled files

function checkAndBuildLink() {
  # Checks a target link location ($2) to see if a file or symlink already
  # exists -- if yes, print the failure and return an appropriate code. If no,
  # link the source file ($1) to the target and return 0.
  Escape="\033";
  RedF="${Escape}[31m"; GreenF="${Escape}[32m";
  Reset="${Escape}[0m";

  ORIGIN=$1
  TARGET=$2
  if [ -L $TARGET ]; then
    echo -e "[${RedF}Symlink${Reset}]: Link $TARGET already exists, skipped.";
    # uncomment below line to remove all existing symbolic links
    # unlink $TARGET
    return 2
  elif [ -f $TARGET ]; then
    echo -e "[${RedF}File${Reset}]: File $TARGET already exists, skipped.";
    return 1
  else
    ln -sf $ORIGIN $TARGET
    echo -e "[${GreenF}Good${Reset}]: built symbolic link: $TARGET";
    return 0
  fi
}

DOTFILE_DIR=`pwd`
DOTFILES="conkyrc gitconfig nethackrc vimrc xmobarrc zshrc"

for file in $DOTFILES; do
  ORIGIN="$DOTFILE_DIR/$file"
  TARGET="$HOME/.$file"
  checkAndBuildLink $ORIGIN $TARGET
done

if [ ! -d "$HOME/.xmonad" ]; then
  mkdir $HOME/.xmonad
  echo "Building Xmonad directory"
fi
checkAndBuildLink "$DOTFILE_DIR/xmonad.hs" "$HOME/.xmonad/xmonad.hs"
