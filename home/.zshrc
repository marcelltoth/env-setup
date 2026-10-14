source ~/.bashrc

# Path to your oh-my-zsh installation.
export ZSH="/home/marce/.oh-my-zsh"


export EDITOR=/usr/bin/vim

ZSH_THEME=""

eval `dircolors ~/.dircolors`

# Disable BEEP
unsetopt BEEP

plugins=(git docker yarn)

source $ZSH/oh-my-zsh.sh

PROMPT='%B%F{41}%n%f%b:%~$ '


# User configuration
alias yolo="git commit --all --amend --no-edit --no-verify && git push --force-with-lease --no-verify"
alias gst="git status"


export GITHUB_TOKEN=
export NPM_TOKEN=
