# .zshrc - github.com/bradcodes

# Set the prompt to something more pleasing
PS1='%B%F{magenta}%m %f%b%# '
RPROMPT='%F{pink}%~%f %F{grey}: %F{magenta}%! '

# Boring $PATH business:
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/bin:/usr/local/bin"
eval `dircolors -b $HOME/.dir_colors`

# nice little (HUGE) weather widget
alias weather='clear; curl wttr.in/98682; echo'

# Navigation
# Enable support for 'z'
#. `brew --prefix`/etc/profile.d/z.sh
alias h="cd ~"
alias up="cd .."
alias vi="vim"
alias -g gg="| grep"

# for kbdlight / github
alias kup='kbdlight up'
alias kdown='kbdlight down'
alias kmid="kbdlight up 20"
alias koff="kbdlight down 50"

# xbps related
# common shortcuts for xbps
alias xi="sudo xbps-install"
alias xsync="sudo xbps-install -Suv"
alias xrm='sudo xbps-remove'
alias xq='sudo xbps-query -Rs'

# Docker aliases
alias dm='docker-machine'
alias dps='docker ps'
alias dpsrun='docker ps -l -q'
alias dmls='docker-machine ls'
alias dmimage='docker images'
alias dmdeb='docker run -i -t debian /bin/bash'

# Docker containers
# These containers exist under MacOS and Debian and are used
# mainly for testing python scripts.
alias dmaui='docker run --rm -h "maui" -t -i maui zsh'
alias dkauai='docker run --rm -h "kauai" -t -i kauai zsh'
alias doahu='docker run --rm -h "oahu" -t -i oahu zsh'
alias dlanai='docker run --rm -h "lanai" -t -i lanai zsh'

# vim-style navigation
bindkey -v
bindkey -M viins ‘jk’ vi-cmd-mode
path+=('/usr/local/bin')
export PATH

# General purpose aliases

# Brew aliases
alias bupdate="brew update"
alias bupgrade="brew upgrade"
alias cask="brew cask"

# Common across all distros/containers/VMs
alias ls="ls --color=auto -F"
alias cl="clear; ls"
alias psa="ps aux"
alias kk="uname -mrs"
alias clp="clear;ls;pwd"
alias p3="ping -c 3"
alias treed="tree -Cd"
alias tree="tree -C"
alias tweet="rainbowstream"
alias sf="clear; echo; neofetch;"   # Because Neofetch is boss.
alias mem='top -l1 | grep PhysMem'

# Editing and sourcing .zshrc
alias zedit="vim ~/.zshrc"
alias zsource="source ~/.zshrc"

# Git aliases
alias g="git"
alias glog="git log"
alias gpretty="git log --pretty=oneline"
alias ggraph="git log --graph --oneline --decorate --all"

# Move and follow file to new dir:
# Example (from ~) mvf test.txt ~/downloads will move the file
# to ~/downloads and cd to that directory.
function mvf {
  if [[ -d $*[-1] ]]; then
    mv $* && cd $*[-1]
  elif [[ -d ${*[-1]%/*} ]]; then
    mv $* && cd ${*[-1]%/*}
  fi
}
# Copy and follow file:
# Just like the mvf() function but this one only copies.
function cpf {
  if [[ -d $*[-1] ]]; then
    cp $* && cd $*[-1]
  elif [[ -d ${*[-1]%/*} ]]; then
    cp $* && cd ${*[-1]%/*}
  fi
}

# Change to whatever directory the Finder is in
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# Use alt+s to insert sudo
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# For zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# For fuzzy finder (yay!)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
