# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/marce/.oh-my-zsh"

fpath=( "$HOME/.zfunctions" $fpath )

export EDITOR=/usr/bin/vim

ZSH_THEME=""

eval `dircolors ~/.dircolors`

# Disable BEEP
unsetopt BEEP

plugins=(git docker yarn zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

PROMPT='%B%F{41}%n%f%b:%~$ '


# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias yolo="git commit --all --amend --no-edit && git push --force"


# export DOCKER_HOST="tcp://$HOST_IP:2375"
export GITHUB_TOKEN=
export NPM_TOKEN=
