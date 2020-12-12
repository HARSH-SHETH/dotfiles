#!/bin/sh
cat ~/.config/nvim/init.vim > ./myneovimrc
cat ~/.vimrc > ./myvimrc
cat ~/.config/i3/config > i3config
echo "updated dot files"
git add myneovimrc myvimrc i3config
git commit -m "updated dot files"
git push origin master
