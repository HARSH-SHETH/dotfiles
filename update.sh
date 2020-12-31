#!/bin/sh
cat ~/.config/nvim/init.vim > ./myneovimrc
cat ~/.vimrc > ./myvimrc
cat ~/.config/i3/config > i3config
cat ~/.zshrc > zshrc
echo "updated dot files"
git add .
git commit -m "updated dot files"
git push origin master
