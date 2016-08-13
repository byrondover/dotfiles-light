#!/usr/bin/env bash
#cp -Rp .{*bash*,*vim*,*zsh*} ~/
for dir in $(find . -type d -path '\./\.*' \! -path '\./\.git*')
do
  mkdir -p $dir
done

for file in $(find . -type f -path '\./\.*' \! -path '\./\.git*')
do
  cp -p ~/$file $file
done
