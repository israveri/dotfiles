#!/usr/bin/bash

#
# Restarts waybar instance
#

killall -9 waybar
waybar &
