#! /bin/bash

dotfiles="$PWD"
pushd ~

#i3 config
rm -rf .config/i3
ln -s "$dotfiles/i3/" .config/i3

popd