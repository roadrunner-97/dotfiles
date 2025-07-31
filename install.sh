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

#kitty
rm -rf .config/kitty/kitty.conf
ln -s "$dotfiles/kitty/kitty.conf" .config/kitty/kitty.conf

#wal template for rofi
rm -rf .config/wal/templates
ln -s "$dotfiles/wal/templates" .config/wal

#rofi conf
rm -rf .config/rofi
ln -s "$dotfiles/rofi" .config/rofi

popd