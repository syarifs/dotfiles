#!/bin/sh

  win=$(xdotool getwindowfocus)
  extends='';
  if [ ! "$win" -eq 309 ]; then
    window=$(xprop WM_CLASS -id "$win" | awk -F '[""]' '{print $4}')
    if [ 1 -eq "$(echo "${#window} > 10" | bc)" ]; then
       extends='...'
    fi
     echo " ${window:0:10}$extends "
   else
     os=$(cat /etc/os-release | grep -E NAME | sed 's/NAME="// ' \
       | sed 's/"//' | head -n 1)
     echo " $os "
  fi



