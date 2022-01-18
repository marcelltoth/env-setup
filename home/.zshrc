# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/marcelltoth/.oh-my-zsh"
 
fpath=( "$HOME/.zfunctions" $fpath )

export EDITOR=/usr/bin/vim

ZSH_THEME=""

eval `dircolors ~/.dircolors`

# Disable BEEP
unsetopt BEEP

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ssh-agent docker yarn zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias cleanmem='echo "sync && echo 3 > /proc/sys/vm/drop_caches" | sudo sh'
alias jetbrains='/opt/jetbrains-toolbox/jetbrains-toolbox'
alias suicide='cmd.exe /c "wsl.exe --shutdown"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion -- disabled because slow

export HOST_IP=`ip route show default | awk '/default/ {print $3}'`
# export DOCKER_HOST="tcp://$HOST_IP:2375"
export GITHUB_TOKEN=
export NPM_TOKEN=

