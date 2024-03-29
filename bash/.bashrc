# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups
# Append to the history file, don't overwrite it
shopt -s histappend

# Setting history length
HISTSIZE=50000
HISTFILESIZE=500000

# Rewrite and read history each time prompt is shown
PROMPT_COMMAND="history -a"

# Check the window size after each command and if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Disable xon/xoff flow-control, so ctrl-s works
stty -ixon

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias grep='grep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# All the bash aliases are in a separate file, load it
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Pick the editor
export EDITOR=`which vim`

# Change the capslock key into escape
/usr/bin/setxkbmap -option "caps:escape"

# Set bin directory into PATH
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Disable loading of the global configuration for screen
export SYSSCREENRC=''

export PYENV_ROOT=$HOME/src/pyenv
PATH="$PYENV_ROOT/bin:$PATH"

# C2C specific
if [ -e "/home/tducrest/.connectionlinks" ]
then
    source "/home/tducrest/.connectionlinks/connectionlinks.rc"
fi

#Npm installation without sudo
export PATH=$PATH:$HOME/.npm/bin

# Set up git with auto completion
source ~/dotfiles/bash/bin/git-completion-config.sh

# Set up prompt with git infos from previous script
e=\\\033
export PS1="\[$e[0;34m\][\u@\h]\[$e[1;33m\]\$(__git_ps1) \[$e[1;36m\] \[$e[0m\]\w\n\[$e[0m\]——> \[$e[0m\]"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# switch between light and dark themes
alias ol="tmux source-file ~/.tmux_light.conf; tmux set-environment THEME 'light'"
alias od="tmux source-file ~/.tmux_dark.conf; tmux set-environment THEME 'dark'"

eval "$(pyenv init -)"

