#!/bin/bash

# default programs
export EDITOR="emacs"

# XDG base directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# termcap vars
export GROFF_NO_SGR=1
export LESS_TERMCAP_mb=$'\e[5;31m' # start blink
export LESS_TERMCAP_md=$'\e[1;34m' # start bold
export LESS_TERMCAP_me=$'\e[0m' # turn off bold, blink, and underline
export LESS_TERMCAP_so=$'\e[7;36m' # start reverse
export LESS_TERMCAP_se=$'\e[0m' # stop standout
export LESS_TERMCAP_us=$'\e[4;32m' # start underline
export LESS_TERMCAP_ue=$'\e[0m' # stop underline

# Colour mapping
# 30: black
# 31: red
# 32: green
# 33: yellow
# 34: blue
# 35: magenta
# 36: cyan
# 37: white
# 39: default

# Effects mapping
# 1: bold
# 2: dim
# 4: underline
# 5: black
# 7: reverse
# 8: hide
