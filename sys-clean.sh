#!/bin/sh
# A system clean-up script. {{{1
# Copyright 2009-2012 Tom Vincent <http://tlvince.com/contact>
# vim: set fdm=marker

# Helpers {{{1
# Is $1 installed?
_have() { which "$1" >/dev/null 2>&1; }

# Main {{{1

# Uninstall orphaned packages
_have pacman && sudo pacman -Rsn $(pacman -Qqdt)

# Clean thumbnails
rm -rf ~/.config/purple/icons/*
rm -rf ~/.thumbnails/*

# Clean trash
rm -rf ~/.local/share/Trash/*
sudo rm -rf /root/.local/share/Trash/*

# Clean pacman cache
_have pacman && sudo pacman -Scc
