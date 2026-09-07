#!/bin/sh
#
# Toggle capslock <-> escape remapping.
# If caps:escape is currently active, disable it; otherwise enable it.

if setxkbmap -query | grep -q 'caps:escape'; then
    # Currently enabled — disable it
    /usr/bin/setxkbmap -option
    echo "caps:escape disabled"
else
    # Currently disabled — enable it
    /usr/bin/setxkbmap -option "caps:escape"
    echo "caps:escape enabled"
fi