#!/usr/bin/env bash

for file in $(find . -type f -path '\./\.*' \! -path '\./\.git*')
do
  cp -p ~/$file $file
done

cp -p ~/.gitconfig .gitconfig
cp -p "${HOME}/Library/Application Support/Code/User/settings.json" vscode-settings.json
cp -Rp ~/.vim/bundle .vim/
rm -rf .vim/bundle/*/.git*
