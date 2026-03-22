#!/bin/bash

rm -rf ./.config ./.tmux ./.tmux.conf
cp -r ~/.config/nvim .config/
cp -r ~/.config/yazi .config/
cp -r ~/.config/hypr .config/
cp -r ~/.tmux .config/
cp -r ~/.tmux.conf .config/
