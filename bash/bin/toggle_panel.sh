#!/bin/sh
#Toggle the display of the xfce panel, which id was passed in param
 
test -z "$1" && echo missing panel id  && exit 1
test ! -z "`echo $1 | sed s/[0-9]*//g`" && echo bad panel id  && exit 1
 
CHANNEL=xfce4-panel
PANELID=$1
PROP=/panels/panel-$PANELID/autohide
 
if `xfconf-query -c $CHANNEL -p $PROP >/dev/null 2>&1`; then
    xfconf-query -c $CHANNEL -T -p $PROP
else
    xfconf-query -c $CHANNEL -n -p $PROP -t bool -s false
fi