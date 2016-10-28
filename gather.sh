#!/usr/bin/env bash

for dir in $(find . -type d -path '\./\.*' \! -path '\./\.git*')
do
  mkdir -p $dir
done

for file in $(find . -type f -path '\./\.*' \! -path '\./\.git*')
do
  cp -p ~/$file $file
done

cp -p ~/.gitconfig .gitconfig
cp -Rp ~/.vim/bundle .vim/
rm -rf .vim/bundle/*/.git*
