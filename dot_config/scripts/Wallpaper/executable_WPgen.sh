#!/bin/bash

magick $1 -blur 0x8 ~/.config/scripts/Wallpaper/blurred.jpg
awww img $1
pkill swaybg
swaybg -o DP-1 -i ~/.config/scripts/Wallpaper/blurred.jpg
