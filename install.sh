#! /bin/bash

dotfiles="$PWD"
pushd ~

#i3 config
rm -rf .config/i3
ln -s "$dotfiles/i3" .config/i3

#polybar config
rm -rf .config/polybar
ln -s "$dotfiles/polybar" .config/polybar

#picom config
rm -rf .config/picom
ln -s "$dotfiles/picom" .config/picom

popd