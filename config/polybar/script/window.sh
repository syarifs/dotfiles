#!/bin/sh

  win=$(xdotool getwindowfocus)
  extends='';
  window=$(xprop WM_CLASS -id "$win" | awk -F '[""]' '{print $4}')

  if [ ! "$window" = "" ]; then
    if [ 1 -eq "$(echo "${#window} > 10" | bc)" ]; then
       extends='...'
    fi
     echo " ${window:0:10}$extends "
   else
     OS=$(cat /etc/os-release | grep -E NAME | sed 's/NAME="// ' | sed 's/"//' | head -n 1)
     echo " $OS "
  fi



