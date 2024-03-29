#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>

## Set GTK Themes, Icons, Cursor and Fonts

THEME='Sweet-Dark'
ICONS='Tela circle manjaro'
FONT='Noto Sans 9'
CURSOR='Adwaita'

SCHEMA='gsettings set org.gnome.desktop.interface'

apply_themes () {
	${SCHEMA} gtk-theme "$THEME"
	${SCHEMA} icon-theme "$ICONS"
	${SCHEMA} cursor-theme "$CURSOR"
	${SCHEMA} font-name "$FONT"
}

apply_themes
