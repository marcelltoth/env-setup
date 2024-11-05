# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
 
export EDITOR=/usr/bin/vim

ZSH_THEME=""

eval `dircolors ~/.dircolors`

# Disable BEEP
unsetopt BEEP

plugins=(git docker yarn zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

PROMPT='%B%F{41}%n%f%b:%~$ '


# User configuration
alias yolo="git commit --all --amend --no-edit && git push --force-with-lease"
alias gst="git status"


export GITHUB_TOKEN=
export NPM_TOKEN=
