# .bash_profile : executed by the command interpreter for login shells.

# Include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# Change that big annoying Caps Lock key into a control key
/usr/bin/setxkbmap -option "ctrl:nocaps"
