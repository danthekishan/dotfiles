#!/usr/bin/env bash

options=(
  " Shutdown"
  " Reboot"
  " Suspend"
  " Logout"
)

choice=$(printf "%s\n" "${options[@]}" \
  | wofi \
      --dmenu \
      --prompt="Power" \
      --lines=4
)

case "$choice" in
  " Shutdown"*) systemctl poweroff ;;
  " Reboot"*)   systemctl reboot   ;;
  " Suspend"*)  systemctl suspend  ;;
  " Logout"*)   hyprctl dispatch exit ;;
esac
