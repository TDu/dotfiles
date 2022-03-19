source ~/dotfiles/bash/bin/git-completion.sh
# Add `g` alias for the `git` command & make completion work for it
alias g=git
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
          || complete -o default -o nospace -F _git g

export GIT_PS1_SHOWDIRTYSTATE=
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWBRANCHREMOTE=1
export GIT_PS1_SHOWUPSTREAM="verbose"
