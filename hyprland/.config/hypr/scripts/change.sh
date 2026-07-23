#!/bin/bash

monitor=$1

active_workspaces=$(hyprctl monitors | grep "active workspace" | awk '{print $3}')
active_on_1=$(echo "$active_workspaces" | head -n 1)
active_on_2=$(echo "$active_workspaces" | tail -n 1)

if [[ $monitor == 1 ]]; then
    hyprctl dispatch "hl.dsp.focus({workspace='$active_on_1'})";
fi
if [[ $monitor == 2 ]]; then
    hyprctl dispatch "hl.dsp.focus({workspace='$active_on_2'})";
fi
